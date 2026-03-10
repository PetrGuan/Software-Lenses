# Grothendieck Mindset — Reframe the Problem Until the Hard Part Becomes Structural

> "The right abstraction can make a hard problem almost inevitable to solve."

**Category:** Strategy
**Skill:** `/grothendieck` — lifts local implementation pain into a stronger model with better invariants

## When to Use

- Repeated bug classes appear in different modules
- Teams keep patching symptoms instead of removing root structure problems
- APIs feel inconsistent because each feature solves the same shape differently
- Data and workflow models are too concrete and hard to evolve
- Refactors stall because local fixes keep reintroducing coupling

## Core Move

Stop asking, "How do we fix this instance?" and ask:
- What larger structure generates this class of problems?
- Which abstraction would make the failure impossible or obvious?
- Which invariant should hold across all variants, not just this file?

Then redesign around the invariant rather than the exception.

## Diagnostic Questions

- What is the common pattern behind these separate incidents?
- Which concept is missing from the model, causing ad-hoc conditionals?
- Are we encoding business rules in scattered call sites instead of one boundary?
- Which constraints are global but enforced locally and inconsistently?
- If we had to support 3 new variants next quarter, would this design bend or fracture?

## Output Format

When analyzing with this mindset, produce:

```
Current Fragmentation:
  [Where equivalent logic is duplicated or inconsistently represented]

Underlying Structure:
  [The shared pattern that should be modeled explicitly]

Target Abstraction:
  [A stronger model/API/boundary that captures the pattern]

Invariant Set:
  [Rules guaranteed by the new structure]

Migration Path:
  [Small sequence of steps from current code to the stronger model]
```

## Anti-Patterns This Catches

- Copy-paste business logic hidden in different layers
- Feature-by-feature branching without a unifying model
- "One-off" fixes that keep multiplying
- Invariants enforced by convention instead of type/boundary design
- Local optimizations that increase global inconsistency

## Pairs Well With

- **Einstein** — Einstein challenges assumptions, Grothendieck rebuilds the model
- **Dijkstra** — Grothendieck defines better structure, Dijkstra enforces local clarity
- **Deming** — Grothendieck fixes conceptual system shape, Deming fixes organizational system shape

## When Not to Over-Apply

- A tactical bug needs immediate containment first
- The domain is stable, small, and unlikely to gain new variants
- The abstraction cost is higher than the expected lifetime value
