# Tao Mindset — Decompose, Reduce, and Iterate Toward a Working Core

> "Complex solutions are often built by reducing to smaller truths and composing them carefully."

**Category:** Strategy
**Skill:** `/tao` — breaks complex engineering problems into solvable subproblems with explicit checkpoints

## When to Use

- A feature is too complex to reason about as one unit
- A migration has many dependencies and uncertain failure points
- A production issue spans multiple services and teams
- An algorithmic or systems problem lacks a clear attack plan
- Effort is blocked by ambiguity about what to prove first

## Core Move

Convert a big problem into a sequence:
- Reduce to a minimal core claim
- Solve that claim with evidence
- Compose into the next layer
- Re-check assumptions at each stage

Progress is measured by verified intermediate results, not optimism.

## Diagnostic Questions

- What is the smallest non-trivial subproblem that unlocks the rest?
- Which assumptions can be validated quickly with a narrow experiment?
- Which dependencies are essential now versus deferrable?
- Where are we mixing proof of correctness with proof of performance?
- What checkpoint would tell us this approach should be abandoned early?

## Output Format

When analyzing with this mindset, produce:

```
Problem Statement:
  [Precise statement of what must be achieved]

Reduction Plan:
  [Subproblem A -> Subproblem B -> Subproblem C]

Checkpoints:
  [For each step: evidence required to continue]

Failure Conditions:
  [Signals that invalidate the current approach]

Next Valid Move:
  [Smallest concrete action that advances proof or implementation]
```

## Anti-Patterns This Catches

- Big-bang implementation without intermediate validation
- Premature scaling work before core correctness is established
- Hidden dependency chains that block delivery late
- "We will figure it out later" plans without stop/go criteria
- Success criteria that are too vague to test

## Pairs Well With

- **Popper** — Tao decomposes the plan, Popper falsifies each claim
- **Turing** — Tao defines staged goals, Turing checks procedural correctness
- **Hamming** — Tao sequences execution, Hamming ensures the target problem matters

## When Not to Over-Apply

- The task is already simple and direct
- Over-decomposition would add coordination overhead
- A known, standard implementation pattern already fits cleanly
