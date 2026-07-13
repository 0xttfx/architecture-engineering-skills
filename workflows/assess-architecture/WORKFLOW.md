# Assess Architecture Workflow

Use this workflow to assess an existing architecture, a proposed architecture, or an architecturally significant change.

## Goal

Produce a traceable architecture assessment that separates observed facts from assumptions and ties recommendations to architecture characteristics, boundaries, and explicit trade-offs.

## Sequence

### 1. Establish architecture significance

Apply `architecture-thinking`.

Stop the full workflow when `requires_architecture_analysis` is `false`. Return the significance result and explain that the concern is a local design or implementation matter.

### 2. Identify architecture characteristics

Apply `architecture-characteristics`.

Select only characteristics that materially influence the problem. Record tensions between characteristics.

### 3. Analyze boundaries

Apply `architecture-boundaries`.

Map relevant change, deployment, execution, data, failure, trust, operational, and policy boundaries. Identify responsibility mixing without immediately prescribing a solution.

### 4. Analyze trade-offs

Apply `architecture-tradeoffs`.

When the user supplied only one option, compare it with at least one credible alternative or with the status quo. Do not invent absurd alternatives merely to make the preferred option look stronger.

### 5. Define fitness functions

Apply `architecture-fitness-functions` to decisions and characteristics that should remain true over time.

Prioritize deterministic verification.

### 6. Produce the assessment

The final assessment must contain:

1. `executive_summary`;
2. `architecture_significance`;
3. `facts_constraints_assumptions_unknowns`;
4. `architecture_characteristics`;
5. `boundary_findings`;
6. `tradeoffs`;
7. `recommendation`;
8. `fitness_functions`;
9. `decisions_to_record`;
10. `open_questions`.

## Decision discipline

For every recommendation, answer:

- Which critical or high-priority characteristic does it protect?
- What does it make worse?
- What new dependency or operational obligation does it introduce?
- What does it explicitly not solve?
- How hard is it to reverse?
- Which evidence supports the recommendation?

If these questions cannot be answered, do not present the recommendation as an architecture decision.

## Evidence precedence

Use this precedence order:

1. deterministic evidence;
2. explicit constraints and authoritative documentation;
3. observed system behavior;
4. user-supplied facts;
5. explicit assumptions;
6. model inference.

Never allow model inference to contradict deterministic evidence without identifying a likely evidence-quality problem.
