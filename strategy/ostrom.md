# Ostrom Mindset

> "Shared resources fail without workable rules, feedback, and accountability."

**Category:** Strategy | **Skill:** `/ostrom`

## When to Use

- Platform code is shared but under-maintained
- Ownership boundaries are unclear
- Teams overuse shared services and degrade reliability
- API consistency drifts over time

## Core Move

Treat shared software as a commons. Define practical rules for contribution, usage, monitoring, and enforcement.

## Diagnostic Questions

- Who can change this shared component and under what guardrails?
- How are misuse and over-consumption detected?
- Are incentives aligned with long-term health?

## Output Format

```
Shared Resource:
  [what commons is being governed]

Current Governance Gaps:
  [ownership, access, review, incident response]

Rule Set:
  [clear local rules, escalation paths, enforcement]

Feedback Loop:
  [metrics and review cadence]
```

## Anti-Patterns This Catches

- Shared code with no explicit owner or contribution policy
- Platform teams that serve everyone but are accountable to no one
- Tragedy-of-the-commons degradation in shared services and databases
- Implicit conventions that erode silently when new teams onboard
- Enforcement that depends entirely on goodwill instead of tooling

## Pairs Well With

- **Deming** — Deming diagnoses the system producing failures, Ostrom designs the governance to prevent them
- **Jacobs** — Jacobs maps healthy boundaries, Ostrom defines the rules that keep shared boundaries functional
- **Meadows** — Meadows finds high-leverage intervention points, Ostrom institutionalizes them as durable rules
- **Liskov** — Liskov enforces substitutability at the interface level, Ostrom enforces it at the organizational level

## When Not to Over-Apply

- The resource is owned by a single team with no shared consumers
- Governance overhead would exceed the coordination benefit for a small, stable system
- The system is in early exploration where rigid rules would slow necessary experimentation
