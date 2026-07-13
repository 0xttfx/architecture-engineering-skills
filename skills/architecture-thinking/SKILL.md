---
name: architecture-thinking
description: Determine whether a problem or proposed change is architecturally significant and select the appropriate depth of architectural analysis. Use before choosing patterns, technologies, or architecture styles.
---

# Architecture Thinking

Determine whether the current problem requires architectural reasoning.

## Core rule

Do not choose an architecture style, pattern, product, or technology before evaluating architectural significance.

## Evaluate significance

Inspect the available context and determine whether the decision changes or constrains one or more of the following:

- system structure or component boundaries;
- ownership of data or state;
- unit of deployment;
- unit of change;
- execution control or orchestration;
- failure domain or recovery model;
- security or trust boundary;
- external integration contract;
- operational topology;
- future decisions through a difficult or expensive-to-reverse choice.

Do not treat code size, number of files, or number of services as sufficient evidence of architectural significance.

## Separate evidence

Classify important statements as:

- `fact`: directly supported by the supplied system evidence;
- `constraint`: a non-negotiable limit or requirement;
- `assumption`: plausible but not yet verified;
- `decision`: a chosen direction;
- `unknown`: information whose absence materially affects the analysis.

Never silently convert an assumption into a fact.

## Determine analysis depth

Use these levels:

- `none`: local implementation detail with no material architectural effect;
- `low`: small structural impact, locally reversible;
- `medium`: cross-component impact or meaningful operational effect;
- `high`: changes boundaries, deployment, state ownership, failure domains, trust boundaries, or execution control;
- `critical`: high-impact decision involving severe irreversibility, material security/compliance exposure, or systemic operational risk.

## Required output

Produce a concise structured result:

```yaml
architecture_significance:
  level: high
  requires_architecture_analysis: true
  reasons:
    - changes_execution_boundary
    - changes_failure_domain

facts: []
constraints: []
assumptions: []
unknowns: []
```

## Behavioral constraints

- Do not recommend microservices, event-driven architecture, hexagonal architecture, or any other pattern in this skill.
- Do not equate complexity with architectural significance.
- Do not manufacture requirements to justify deeper analysis.
- State when the evidence is insufficient.
