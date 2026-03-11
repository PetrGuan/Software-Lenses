# Simon Mindset

> "Perfect optimization is rare; strong engineering chooses good-enough with intent."

**Category:** Strategy | **Skill:** `/simon`

## When to Use

- Architecture choices are blocked by endless analysis
- Teams cannot agree on tradeoffs
- Planning needs a stop condition

## Core Move

Define satisficing thresholds: what must be true now, what can wait, and when to revisit.

## Diagnostic Questions

- What minimum bar defines acceptable quality?
- Which unknowns are decision-critical vs deferrable?
- What revisit trigger would invalidate this choice?

## Output Format

```
Decision Target:
  [what is being chosen]

Must-Haves vs Nice-to-Haves:
  [explicit threshold]

Chosen Option:
  [why it satisfies now]

Revisit Triggers:
  [events/metrics that force re-evaluation]
```

## Anti-Patterns This Catches

- Analysis paralysis where teams delay shipping to chase a perfect design
- Implicit quality bars that shift depending on who is in the room
- Decisions revisited repeatedly because no explicit threshold was set
- Over-engineering for hypothetical future requirements that may never arrive
- Treating all unknowns as blockers instead of distinguishing deferrable ones

## Pairs Well With

- **Boyd** — Simon decides when enough information is enough, Boyd accelerates the loop that acts on it
- **Taleb** — Simon satisfices for the expected case, Taleb stress-tests the tail risks Simon might accept
- **Hamming** — Hamming asks whether this is the right problem to solve, Simon asks how good the solution needs to be
- **Polya** — Polya structures the problem-solving process, Simon provides the stopping criteria

## When Not to Over-Apply

- The decision is genuinely high-stakes and irreversible, warranting deeper analysis
- Safety-critical systems where "good enough" tolerances must be formally verified
- The team already ships fast and the bottleneck is quality, not decision speed
