---
name: architecture-tradeoffs
description: Compare architectural decision candidates by making gains, degradations, introduced dependencies, risks, reversibility, and unresolved concerns explicit. Use when two or more plausible options or a consequential architecture choice must be evaluated.
---

# Architecture Trade-offs

Evaluate architecture decisions as trade-offs rather than universal best practices.

## Core rule

Never state that an architectural option is simply "better" without naming the context and characteristics against which it is better.

## Inputs

Use:

- established facts and constraints;
- prioritized architecture characteristics;
- relevant boundaries;
- candidate decisions;
- deterministic evidence when available.

## Analyze each candidate

For every candidate, identify:

- `improves`: characteristics or operational properties strengthened;
- `degrades`: characteristics or properties weakened;
- `introduces`: new dependencies, coupling, failure modes, or operational obligations;
- `does_not_solve`: adjacent concerns that remain outside the decision;
- `risks`: credible negative outcomes;
- `reversibility`: `easy`, `moderate`, `hard`, or `very_hard`;
- `evidence`: facts supporting the analysis;
- `assumptions`: unverified premises affecting the conclusion.

## Compare against priorities

Weight the assessment qualitatively against the prioritized architecture characteristics.

A candidate that improves a low-priority characteristic while degrading a critical characteristic should normally be rejected unless a constraint requires it.

Do not use invented numeric precision unless a supplied decision model defines weights and scoring rules.

## Required output

```yaml
tradeoffs:
  - decision: semaphore_as_controlled_execution_plane
    improves:
      - auditability
      - execution_governance
      - access_control
    degrades:
      - operational_simplicity
    introduces:
      - control_plane_dependency
      - semaphore_operational_ownership
    does_not_solve:
      - source_validation
      - desired_state_ownership
      - event_classification
    risks:
      - execution_unavailable_when_control_plane_is_unavailable
    reversibility: hard
    evidence: []
    assumptions: []

recommendation:
  preferred_candidate: semaphore_as_controlled_execution_plane
  rationale: >-
    The candidate improves critical auditability and execution governance at the
    cost of lower-priority operational simplicity.
```

## Behavioral constraints

- Do not hide disadvantages of the preferred option.
- Do not use "best practice" as evidence.
- Do not compare candidates against characteristics that were never established without explicitly introducing and justifying them.
- Name what the chosen option does not solve.
