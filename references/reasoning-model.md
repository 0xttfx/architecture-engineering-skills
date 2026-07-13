# Architecture Reasoning Model

The repository follows a problem-first reasoning flow.

```text
Problem or proposed change
        |
        v
Architectural significance
        |
        v
Architecture characteristics
        |
        v
Boundary analysis
        |
        v
Trade-off analysis
        |
        v
Decision recommendation
        |
        v
Fitness functions
        |
        v
Continuous architecture evidence
```

## Why patterns are not first-class skills in the initial milestone

Pattern-first activation can bias the analysis toward a familiar solution before the relevant characteristics and constraints have been established.

The first milestone therefore focuses on reasoning primitives. Architecture styles and patterns will later be added as reference primitives used by a style-selection skill.

Expected future flow:

```text
characteristics + constraints + boundaries
                   |
                   v
          style-selection skill
                   |
      +------------+-------------+
      |            |             |
      v            v             v
 service-based  event-driven  microservices
      |            |             |
      +------------+-------------+
                   |
                   v
             trade-off analysis
```

Pattern documentation should describe forces, characteristics supported, characteristics degraded, boundary implications, operational obligations, failure modes, and contraindications.
