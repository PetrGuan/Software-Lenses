# Liskov Mindset

> "Interfaces are promises about behavior, not just shape."

**Category:** Architecture | **Skill:** `/liskov`

## When to Use

- Implementations share an interface but behave inconsistently
- Refactors break clients unexpectedly
- Inheritance/composition boundaries are unclear

## Core Move

Verify preconditions, postconditions, and invariants across implementations.

## Output Format

```
Contract Surface:
  [interface and clients]

Substitutability Risks:
  [where an implementation violates expectations]

Contract Fixes:
  [tighten/relax clauses, split interfaces]
```

## Diagnostic Questions

- Can every implementation of this interface be swapped in without changing caller behavior?
- Does any subclass strengthen a precondition or weaken a postcondition?
- Are callers using type-checks or instanceof guards to handle specific implementations?
- If a new implementation were added tomorrow, would existing clients break?
- Is the interface organized around caller needs, or around implementation convenience?

## Anti-Patterns This Catches

- Subtypes that throw unexpected exceptions or silently change return semantics
- God interfaces that force implementations to stub out irrelevant methods
- Callers that branch on concrete type instead of relying on the contract
- Refactors that preserve the type signature but alter observable behavior
- Inheritance hierarchies where children override parents in contradictory ways

## Pairs Well With

- **Hoare** — Liskov checks substitutability, Hoare formalizes the contract each substitute must honor
- **Dijkstra** — Liskov defines what must hold across implementations, Dijkstra structures the reasoning
- **Einstein** — Liskov audits existing contracts, Einstein questions whether the interface boundary is in the right place
- **Wittgenstein** — Liskov ensures behavioral consistency, Wittgenstein checks whether the naming reflects the real semantics

## When Not to Over-Apply

- The system has only one implementation and no planned extension points
- Enforcing strict substitutability on internal helpers adds friction without safety
- The interface is intentionally loose (e.g., plugin systems where variance is the point)
- The codebase is early-stage and contracts are still being discovered through iteration
