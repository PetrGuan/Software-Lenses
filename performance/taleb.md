# Taleb Mindset

> "Prevent ruin, limit downside, and gain from small stressors."

**Category:** Performance | **Skill:** `/taleb`

## When to Use

- Rare failures cause outsized damage
- Capacity planning ignores tail events
- Single points of failure dominate risk

## Core Move

Identify ruin scenarios, cap downside, and introduce optionality.

## Output Format

```
Fragility Map:
  [components with nonlinear downside]

Ruin Scenarios:
  [low-frequency, high-impact events]

Downside Controls:
  [circuit breakers, isolation, rollback]

Antifragile Opportunities:
  [safe-to-fail experiments, progressive delivery]
```

## Diagnostic Questions

- What is the worst-case blast radius if this component fails completely?
- Are we optimizing for average performance at the cost of tail resilience?
- Which dependencies are single points of failure with no fallback?
- Can the system survive a correlated failure across two or more components?
- Are we running safe-to-fail experiments that expose hidden fragility?

## Anti-Patterns This Catches

- Optimizing for median latency while ignoring p99 catastrophes
- Shared-nothing claims that hide shared dependencies (DNS, config stores, clocks)
- Missing circuit breakers that let one slow service cascade into total outage
- Capacity plans built on Gaussian assumptions when the real distribution has fat tails
- Rollback paths that have never been exercised under realistic conditions

## Pairs Well With

- **Wiener** — Taleb identifies where ruin hides, Wiener stabilizes the loops that prevent it
- **Heisenberg** — Taleb maps what can go wrong, Heisenberg maps what we cannot measure precisely
- **Lamport** — Taleb surfaces distributed failure modes, Lamport formalizes the ordering guarantees
- **Popper** — Taleb asks "what would ruin us," Popper asks "what would disprove our safety assumption"

## When Not to Over-Apply

- The failure mode is well-understood and already mitigated with proportionate controls
- Adding resilience layers would introduce more complexity than the risk warrants
- The system is disposable or stateless and quick to rebuild from scratch
