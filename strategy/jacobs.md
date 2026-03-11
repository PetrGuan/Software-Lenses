# Jacobs Mindset

> "Healthy systems balance local autonomy with coherent interfaces."

**Category:** Strategy | **Skill:** `/jacobs`

## When to Use

- Monolith vs microservice decisions are polarized
- One standard is forcing poor local fits
- Architecture loses adaptability as scale increases

## Core Move

Design for mixed-use modularity: strong interfaces, local variation, and cross-boundary observability.

## Diagnostic Questions

- Which boundaries reduce coupling vs create bureaucratic friction?
- Where is forced standardization reducing local effectiveness?
- Which interfaces are too weak to support autonomy?

## Output Format

```
Boundary Map:
  [modules and interaction intensity]

Diversity vs Coherence Gaps:
  [where either side is overdone]

Interface Upgrades:
  [contracts, ownership, observability]

Resilience Impact:
  [how failures localize vs cascade]
```

## Anti-Patterns This Catches

- Monoculture architectures where one bad assumption propagates everywhere
- Over-standardization that forces teams into ill-fitting patterns
- Boundaries drawn for org-chart reasons rather than coupling analysis
- Microservice sprawl with weak contracts that create distributed monoliths
- Ignoring cross-boundary observability until cascading failures occur

## Pairs Well With

- **Ostrom** — Ostrom governs the shared commons, Jacobs ensures the boundaries around them support local diversity
- **Grothendieck** — Grothendieck finds the unifying abstraction, Jacobs validates that it still permits healthy local variation
- **Simon** — Simon defines satisficing thresholds for boundary decisions, Jacobs evaluates whether the resulting structure stays resilient
- **Wiener** — Wiener maps feedback and control flows, Jacobs checks whether boundaries preserve or distort those flows

## When Not to Over-Apply

- The system is small enough that a single consistent model is genuinely the simplest answer
- Introducing diversity would create maintenance cost with no resilience benefit
- Teams are early-stage and need convergence before they can afford divergence
