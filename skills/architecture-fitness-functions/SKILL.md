---
name: architecture-fitness-functions
description: Convert architectural intent and decisions into continuously verifiable fitness functions, preferring deterministic checks over model inference. Use after important characteristics, boundaries, or decisions have been established.
---

# Architecture Fitness Functions

Translate architectural intent into explicit evidence-producing checks.

## Core rule

If a property can be checked deterministically, the agent must not guess it.

## Classify the assertion

For each architectural assertion, classify verification as:

- `deterministic`: objective and reproducible from machine-readable evidence;
- `bounded_semantic`: requires interpretation but can be constrained by explicit criteria and evidence;
- `human_decision`: requires accountable human judgment or approval.

Do not disguise human judgment as a deterministic test.

## Deterministic checks

Prefer existing analyzers and platform-native validation before creating custom checks.

Possible check types include:

- schema validation;
- dependency rules;
- forbidden imports or references;
- graph constraints;
- policy-as-code;
- configuration validation;
- ownership metadata validation;
- registry reference validation;
- deployment topology checks;
- API or contract compatibility checks;
- observability evidence queries;
- recovery test evidence;
- execution audit completeness.

A deterministic check must define:

- assertion;
- evidence source;
- evaluation method;
- pass condition;
- failure output.

## Bounded semantic checks

When semantic reasoning is unavoidable:

1. provide the evidence set;
2. define explicit evaluation questions;
3. require the model to distinguish evidence from inference;
4. require uncertainty to be stated;
5. prevent the model from overriding deterministic failures.

## Required output

```yaml
fitness_functions:
  - id: ARC-EXEC-001
    assertion: Production execution must originate from a validated and traceable intent.
    verification: deterministic
    evidence_source:
      - execution_record
      - execution_intent
    evaluation:
      type: correlation
      required_fields:
        - source
        - revision_or_event
        - target
        - action
        - approval_state
        - result
    pass_condition: All production execution records correlate to one valid execution intent.
    failure_output: List uncorrelated execution records.
```

## Quality criteria

A useful fitness function is:

- aligned with an established architecture characteristic or decision;
- observable from explicit evidence;
- repeatable;
- precise enough to fail;
- assigned to a lifecycle stage such as PR, merge, deploy, runtime, or periodic review;
- owned by a team or control plane.

## Behavioral constraints

- Do not ask an LLM to count, parse, or infer information already available from deterministic tools.
- Do not create vanity metrics that cannot change an architectural decision.
- Do not use a fitness function as an undocumented architecture decision.
- A failed deterministic check remains failed until the evidence changes or an accountable exception is recorded.
