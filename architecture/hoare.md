# Hoare Mindset

> "Clarity comes from explicit conditions, not implied intent."

**Category:** Architecture | **Skill:** `/hoare`

## When to Use

- Core business functions are fragile
- Edge cases are hard to reason about
- Reviews debate style instead of correctness

## Core Move

Write contracts and check each branch against them.

## Output Format

```
Preconditions:
  [required state]

Postconditions:
  [guaranteed results]

Invariant Checks:
  [must-hold properties]

Violations:
  [where code can break contract]
```

## Diagnostic Questions

- What must be true before this function is called?
- What does this function guarantee when it returns successfully?
- Which properties must hold throughout the entire operation, even mid-mutation?
- Are error paths preserving the same invariants as success paths?
- Could a caller violate the precondition without getting an immediate, clear failure?

## Anti-Patterns This Catches

- Functions that silently accept invalid input and corrupt state downstream
- Postconditions that hold on the happy path but not on error or timeout paths
- Invariants that are documented but never enforced in code
- Defensive checks scattered ad hoc instead of centralized at contract boundaries
- Implicit ordering dependencies masquerading as independent operations

## Pairs Well With

- **Liskov** — Hoare specifies the contract, Liskov verifies all implementations honor it
- **Dijkstra** — Hoare defines what must hold, Dijkstra structures the proof that it does
- **Lamport** — Hoare reasons about single-node correctness, Lamport extends it across time and replicas
- **Feynman** — Hoare formalizes the contract, Feynman checks whether anyone can explain it plainly

## When Not to Over-Apply

- The code is exploratory or throwaway and contracts would slow iteration
- The function is trivially simple with no meaningful failure modes
- Over-specifying contracts on internal helpers adds ceremony without safety
- The system already has strong type-level guarantees that make runtime checks redundant
