# Darwin Mindset

> "It is not the strongest of the species that survives, nor the most intelligent, but the one most responsive to change."

**Category:** Evolution | **Skill:** `/darwin`

## When to Use

- Codebase has accumulated layers of dead or vestigial code that nobody dares remove
- Technical debt discussions lack a framework for deciding what to pay down and what to leave
- Refactors break things because dependencies have evolved implicit assumptions over time
- APIs or data models have "evolved" through accretion rather than design, and nobody remembers why certain shapes exist
- Teams argue about rewriting vs. incrementally improving

## Core Move

Treat code as a population under selective pressure: what survives is what gets called, tested, and maintained. Ask which code is **fit** for its current environment, which is **vestigial** (once useful, now dead weight), and which **mutations** (recent changes) are adaptive vs. harmful. Then decide: adapt, migrate, or let it go extinct.

## Key Concepts

- **Fitness** — does the code serve its current environment (callers, load, requirements), not the environment it was written for?
- **Vestigial structures** — code paths, parameters, config flags, or abstractions that remain from a previous era but serve no current purpose
- **Selective pressure** — what forces act on this code? (test suite, production traffic, review standards, deployment frequency)
- **Adaptation vs. accretion** — did the code *evolve toward* its current shape through deliberate selection, or did it just *accumulate*?
- **Speciation** — when forks or copies of the same logic diverge until they can no longer be unified
- **Extinction** — when removal is healthier than maintenance

## Diagnostic Questions

1. If you deleted this module tomorrow, what would break — and would anyone notice within a week?
2. Which parts of the code were written for constraints that no longer exist (old framework, retired service, abandoned feature)?
3. Where has copy-paste created divergent "species" of the same logic that now behave differently?
4. What selective pressures actually act on this code? (Is it tested? Monitored? Reviewed? Deployed frequently?)
5. Is the current shape the result of deliberate refactoring or incremental accretion of patches?
6. Which dependencies have co-evolved so tightly that changing one requires changing the other?

## Output Format

```
Fitness Assessment
  [Which code is well-adapted to its current callers, load, and requirements]

Vestigial Structures
  [Dead code, unused parameters, legacy branches, obsolete config — with file:line refs]

Selective Pressures
  [What forces maintain or erode quality: test coverage, deploy frequency, review rigor]

Speciation Risks
  [Forked logic, divergent copies, near-duplicates evolving independently]

Adaptation Recommendations
  [What to refactor, what to remove, what to leave alone — with rationale]
```

## Anti-Patterns This Catches

- **Vestigial code** — unused feature flags, dead branches behind `if false`, parameters nobody passes, entire files with zero callers
- **Fossil layers** — commented-out code, TODO comments from years ago, migrations that will "run someday"
- **Accidental speciation** — utility functions copy-pasted across services that now handle edge cases differently
- **Over-preservation** — refusing to delete code "in case we need it" when version control already preserves history
- **Environment mismatch** — code optimized for constraints (old DB, old framework, low traffic) that no longer apply

## Pairs Well With

- **Hamming** — Hamming asks if the work matters; Darwin asks if the code is fit for its environment
- **Grothendieck** — Grothendieck unifies divergent copies into a shared abstraction; Darwin identifies which copies have speciated beyond rescue
- **Deming** — Deming improves the system that produces code; Darwin evaluates whether the code produced is surviving or decaying

## When Not to Over-Apply

- For brand-new code with no evolutionary history yet
- When stability is the goal and the code is genuinely fit — not everything needs to evolve
- When "delete it" is politically infeasible and the analysis would just create friction without action
