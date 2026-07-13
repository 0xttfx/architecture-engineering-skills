---
name: architecture-characteristics
description: Identify, define, and prioritize architecture characteristics that materially shape a system or architectural decision. Use after architectural significance has been established and before comparing architecture options.
---

# Architecture Characteristics

Identify the characteristics the architecture must deliberately preserve or optimize.

## Core rule

Do not create a generic checklist of desirable qualities. Select only characteristics that materially influence the decision under analysis.

## Discovery

Derive candidate characteristics from:

- explicit business or product goals;
- regulatory, security, and compliance constraints;
- operational responsibilities and incident history;
- workload and integration behavior;
- deployment and recovery expectations;
- organizational structure and ownership;
- known failure modes;
- existing architectural decisions.

Examples include availability, auditability, deployability, elasticity, evolvability, interoperability, maintainability, observability, operability, recoverability, reliability, scalability, security, simplicity, testability, and traceability.

This list is illustrative, not exhaustive.

## Make characteristics testable

For each selected characteristic, define:

- `name`;
- `priority`: `low`, `medium`, `high`, or `critical`;
- `rationale`;
- `stimulus`: the event or condition that exercises the characteristic;
- `response`: expected system or organizational response;
- `measure`: evidence that could demonstrate whether the expectation is met.

Prefer measurable scenarios over adjectives.

Bad:

```text
The platform must be highly auditable.
```

Better:

```text
For every production configuration execution, the organization must be able to identify the initiating source, validated revision, actor or event, target, selected action, approval state, execution result, and timestamps.
```

## Resolve characteristic tension

Explicitly identify characteristics that are likely to compete.

Examples:

- simplicity versus extensibility;
- availability versus consistency;
- isolation versus operational cost;
- security controls versus deployability;
- centralized governance versus team autonomy.

Do not resolve the tension in this skill. Pass it to trade-off analysis.

## Required output

```yaml
architecture_characteristics:
  - name: auditability
    priority: critical
    rationale: Production executions require traceable evidence.
    stimulus: A production change or remediation is executed.
    response: The execution path records source, intent, target, approval and result.
    measure: 100% of production executions have a correlated execution record.

characteristic_tensions:
  - [operational_simplicity, auditability]
```

## Behavioral constraints

- Do not mark every characteristic as `critical`.
- Do not infer a characteristic solely because a technology supports it.
- Do not recommend products or patterns here.
- Preserve distinctions between business drivers, constraints, and architecture characteristics.
