# Arendt Mindset

> "The sad truth is that most evil is done by people who never make up their minds to be good or evil."

**Category:** Strategy | **Skill:** `/arendt`

## When to Use

- A feature collects, stores, or processes user data and nobody has asked whether it should
- Dark patterns, manipulative UX, or engagement traps are implemented without discussion
- Automation removes human judgment from decisions that affect people's lives, money, or access
- The team builds what's requested without questioning who is harmed or excluded
- Algorithmic decisions (ranking, filtering, pricing, moderation) lack transparency or recourse
- Compliance is treated as a checkbox rather than a design constraint

## Core Move

Apply Arendt's "banality" lens: **harm at scale doesn't require malice — it requires ordinary people building what they're told without questioning consequences.** For every feature, ask: who is affected, who has no voice, what happens at scale, and whether someone can appeal when the system is wrong.

## Key Concepts

- **Banality of implementation** — engineers building harmful features not from malice but from uncritical compliance with requirements
- **Thoughtlessness at scale** — a small UX friction or algorithmic bias affects millions of users. Individual harm is small; aggregate harm is enormous
- **The right to appeal** — automated decisions must have a path for humans to contest outcomes. Systems without recourse create powerlessness
- **Consent and transparency** — users should know what data is collected, how it's used, and have meaningful choice. "Agree to everything" is not consent
- **Exclusion by default** — who can't use this system? (Accessibility, language, connectivity, economic access, cultural assumptions)
- **Accountability gap** — when nobody is personally responsible for an outcome, harmful patterns persist because "the system" decided

## Diagnostic Questions

1. If this feature were described honestly to the people it affects, would they consent? Would they feel deceived?
2. Who is most vulnerable to this system's errors or biases? (Low-income users, non-native speakers, disabled users, minorities)
3. When the system makes a wrong decision about someone, what is their recourse? Can they appeal? Can they even see why the decision was made?
4. What data is collected and is all of it necessary? Could it be used in ways the user wouldn't expect?
5. At 10x or 100x current scale, what harms emerge that don't exist at current scale?
6. Is anyone on the team empowered to say "we should not build this"?

## Output Format

```
Impact Assessment
  [Who is affected by this code, and how — users, communities, vulnerable groups]

Consent and Transparency
  [What users know vs. what actually happens with their data and interactions]

Recourse Paths
  [Whether affected parties can contest, appeal, or opt out of automated decisions]

Exclusion Analysis
  [Who is excluded or disadvantaged by design assumptions — with file:line refs]

Scale Effects
  [Harms that emerge or amplify at larger scale]

Recommendations
  [Specific design changes to increase transparency, consent, recourse, and inclusion]
```

## Anti-Patterns This Catches

- **Dark patterns** — pre-checked consent boxes, confusing opt-out flows, "confirm-shaming," hidden unsubscribe paths
- **Accountability void** — automated decisions (bans, pricing, content moderation) with no human review and no appeal process
- **Invisible collection** — tracking, fingerprinting, or behavioral data gathered without clear disclosure
- **Hostile defaults** — settings that benefit the platform at the user's expense unless they dig through menus to change them
- **Monoculture bias** — assumptions about language, currency, name formats, gender, able-bodiedness baked into data models
- **Compliance theater** — GDPR/CCPA banners that technically exist but don't provide meaningful control

## Pairs Well With

- **Ostrom** — Ostrom governs shared resources; Arendt asks whose voice is missing from that governance
- **Deming** — Deming improves the system; Arendt asks whether the system should exist in its current form
- **Feynman** — Feynman demands clarity; Arendt demands honesty about impact, not just technical clarity

## When Not to Over-Apply

- For internal tooling with no external user impact
- When the ethical questions have already been explicitly addressed and documented
- For purely technical infrastructure with no user-facing decisions
