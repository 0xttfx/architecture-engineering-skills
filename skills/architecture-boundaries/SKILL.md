---
name: architecture-boundaries
description: Identify architectural boundaries, component responsibilities, and responsibility mixing. Use to reason about units of change, deployment, execution, data ownership, trust, and failure before selecting architecture styles or redistributing responsibilities.
---

# Architecture Boundaries

Identify where architectural responsibilities begin and end.

## Core rule

A component name or product category does not define its architectural responsibility. Infer responsibilities from actual behavior, data, dependencies, and execution authority.

## Boundary dimensions

Analyze relevant boundaries independently:

- `change_boundary`: what normally changes together;
- `deployment_boundary`: what is released or deployed together;
- `execution_boundary`: where an action is authorized and executed;
- `data_boundary`: who owns authoritative state;
- `failure_boundary`: what can fail independently and the blast radius;
- `trust_boundary`: where identity, authorization, or data trust changes;
- `operational_boundary`: who operates and supports the component;
- `policy_boundary`: where rules are evaluated or enforced.

Do not assume these boundaries are identical.

## Responsibility analysis

For each relevant component, identify:

- primary responsibilities;
- secondary responsibilities;
- responsibilities the component currently performs but should be questioned;
- responsibilities explicitly outside the component's role;
- authoritative state owned by the component;
- commands or intents accepted;
- events or evidence emitted.

## Detect responsibility mixing

Flag a concern when a component simultaneously owns responsibilities whose combination creates unclear authority, hidden coupling, or conflicting change drivers.

Examples that deserve investigation:

- change validation and unrestricted production execution;
- event classification and implementation-specific remediation logic;
- desired-state ownership and ad hoc runtime mutation without reconciliation;
- evidence generation and unilateral approval of the same control;
- orchestration and ownership of all domain policies.

These combinations are not automatically forbidden. Analyze the trade-off and constraints.

## Required output

```yaml
components:
  - name: droneci
    primary_responsibilities:
      - change_validation
      - quality_gate
    questioned_responsibilities:
      - direct_production_execution
    outside_role:
      - runtime_event_interpretation
    owns_authoritative_state: []
    accepts:
      - repository_change
    emits:
      - validation_evidence
      - validated_execution_intent

boundary_findings:
  - id: BND-001
    dimension: execution_boundary
    concern: Change validation and production execution authority are mixed.
    evidence: []
    impact:
      - auditability
      - security
```

## Authority discipline

Do not infer authority from participation, data provision,
execution capability, or workflow position.

Distinguish:

- `provider`: supplies information or capability;
- `producer`: creates an intent, event, artifact, or record;
- `decision_authority`: has authority to choose an outcome;
- `enforcement_authority`: may allow or deny an action;
- `execution_authority`: performs the action;
- `state_authority`: owns the authoritative state;
- `precedence_authority`: resolves conflicting intents or states.

A component may hold more than one authority, but each authority
must be supported by explicit evidence or classified as inferred.

When multiple producers can affect the same execution target,
identify unresolved precedence authority.

## Behavioral constraints

- Do not invent a service boundary because two responsibilities have different names.
- Do not prescribe microservices as a boundary mechanism.
- Do not assume process, container, VM, or repository boundaries are architectural boundaries without evidence.
- Keep descriptive findings separate from recommendations.
