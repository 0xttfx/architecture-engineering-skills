#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_REPO_ROOT="$(cd -- "${SCRIPT_DIR}/.." && pwd)"
CONSUMER_ROOT="${1:-$(pwd)}"
CONSUMER_ROOT="$(cd -- "${CONSUMER_ROOT}" && pwd)"

SOURCE_SKILLS_DIR="${SKILLS_REPO_ROOT}/skills"
TARGET_SKILLS_DIR="${CONSUMER_ROOT}/.agents/skills"

log() {
  printf '[architecture-skills] %s\n' "$*"
}

fail() {
  printf '[architecture-skills] ERROR: %s\n' "$*" >&2
  exit 1
}

[[ -d "${SOURCE_SKILLS_DIR}" ]] \
  || fail "skills directory not found: ${SOURCE_SKILLS_DIR}"

[[ -d "${CONSUMER_ROOT}" ]] \
  || fail "consumer repository not found: ${CONSUMER_ROOT}"

if [[ ! -d "${CONSUMER_ROOT}/.git" && ! -f "${CONSUMER_ROOT}/.git" ]]; then
  fail "target is not a Git working tree root: ${CONSUMER_ROOT}"
fi

mkdir -p "${TARGET_SKILLS_DIR}"

installed=0
unchanged=0

for skill_dir in "${SOURCE_SKILLS_DIR}"/*; do
  [[ -d "${skill_dir}" ]] || continue
  [[ -f "${skill_dir}/SKILL.md" ]] || continue

  skill_name="$(basename -- "${skill_dir}")"
  target="${TARGET_SKILLS_DIR}/${skill_name}"

  # Compute a relative target so the links remain portable with the repository.
  relative_source="$(python3 - "${skill_dir}" "${TARGET_SKILLS_DIR}" <<'PY'
import os
import sys

source, start = sys.argv[1], sys.argv[2]
print(os.path.relpath(source, start=start))
PY
)"

  if [[ -L "${target}" ]]; then
    current_target="$(readlink "${target}")"

    if [[ "${current_target}" == "${relative_source}" && -f "${target}/SKILL.md" ]]; then
      log "unchanged: ${skill_name}"
      ((unchanged += 1)) || true
      continue
    fi

    fail "conflicting symlink: ${target} -> ${current_target}"
  fi

  if [[ -e "${target}" ]]; then
    fail "target already exists and is not a symlink: ${target}"
  fi

  ln -s "${relative_source}" "${target}"
  log "installed: ${skill_name} -> ${relative_source}"
  ((installed += 1)) || true
done

broken=0
for skill_link in "${TARGET_SKILLS_DIR}"/*; do
  [[ -L "${skill_link}" ]] || continue

  if [[ ! -f "${skill_link}/SKILL.md" ]]; then
    printf '[architecture-skills] BROKEN: %s -> %s\n' \
      "${skill_link}" \
      "$(readlink "${skill_link}")" >&2
    ((broken += 1)) || true
  fi
done

if (( broken > 0 )); then
  fail "${broken} broken skill symlink(s) detected"
fi

log "complete: installed=${installed} unchanged=${unchanged}"
log "discovery path: ${TARGET_SKILLS_DIR}"
