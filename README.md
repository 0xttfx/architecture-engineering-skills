# Architecture Engineering Skills

A portable Agent Skills knowledge and workflow repository for architectural reasoning.

The repository treats software architecture as a decision discipline: identify architecturally significant concerns, prioritize architecture characteristics, expose trade-offs, clarify boundaries, and convert important decisions into continuously verifiable fitness functions.

## Principles

1. Start with the problem, not a pattern.
2. Separate facts, constraints, assumptions, and decisions.
3. Make trade-offs explicit; never present an architecture choice as universally "best".
4. Do not infer deterministic facts when they can be measured or validated.
5. Patterns are knowledge primitives consulted after the problem is characterized.
6. Architecture review should produce evidence and decision records, not aesthetic opinions.

## Initial skills

| Skill | Responsibility |
|---|---|
| `architecture-thinking` | Determine architectural significance and required depth of analysis. |
| `architecture-characteristics` | Identify and prioritize the characteristics a system must preserve. |
| `architecture-tradeoffs` | Compare candidate decisions through gains, losses, risks, and unresolved concerns. |
| `architecture-boundaries` | Detect responsibility mixing and reason about execution, change, deploy, data, and failure boundaries. |
| `architecture-fitness-functions` | Convert architectural intent into deterministic or explicitly semantic checks. |

## Workflow

`workflows/assess-architecture/WORKFLOW.md` composes the initial skills in a fixed reasoning sequence:

```text
Context
  -> Architecture significance
  -> Architecture characteristics
  -> Boundaries
  -> Trade-offs
  -> Fitness functions
  -> Assessment
```

## Repository layout

```text
architecture-engineering-skills/
├── skills/
│   ├── architecture-thinking/
│   │   └── SKILL.md
│   ├── architecture-characteristics/
│   │   └── SKILL.md
│   ├── architecture-tradeoffs/
│   │   └── SKILL.md
│   ├── architecture-boundaries/
│   │   └── SKILL.md
│   └── architecture-fitness-functions/
│       └── SKILL.md
├── workflows/
│   └── assess-architecture/
│       └── WORKFLOW.md
├── schemas/
│   ├── architecture-context.schema.json
│   └── architecture-assessment.schema.json
└── references/
    └── reasoning-model.md
```

## Scope of the first milestone

This milestone deliberately excludes architecture-style and pattern skills. Layered architecture, service-based architecture, event-driven architecture, microservices, modular monoliths, microkernel architecture, and related patterns should be introduced only after the core reasoning workflow is stable.

## Intellectual foundation

The reasoning model is inspired by the architecture discipline described by Mark Richards and Neal Ford in *Fundamentals of Software Architecture: An Engineering Approach*. This repository is an independent implementation of architectural reasoning workflows and does not reproduce book text.
