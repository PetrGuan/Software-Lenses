# Hopper Mindset

> "Good tools and language design multiply developer effectiveness."

**Category:** Architecture | **Skill:** `/hopper`

## When to Use

- Boilerplate dominates feature work
- Repeated implementation patterns should be tooling
- API ergonomics are slowing teams

## Core Move

Promote repeated low-value manual work into reusable abstractions, generators, or internal tooling.

## Output Format

```
Accidental Complexity Inventory:
  [repeated manual work]

Abstraction Candidates:
  [common patterns to encode once]

Tooling Proposal:
  [automation, templates, interfaces]
```

## Diagnostic Questions

- How much of each feature's effort is spent on boilerplate versus business logic?
- Is this pattern repeated more than twice, and could a shared abstraction replace it?
- Would a code generator, template, or internal library eliminate an entire class of mistakes?
- Are developers working around the tool rather than being empowered by it?
- If a new team member started today, which manual steps would surprise them most?

## Anti-Patterns This Catches

- Copy-paste code that drifts into subtly inconsistent variants
- Manual deployment or configuration steps that should be automated
- Abstractions that leak implementation details and force callers to compensate
- Internal tools that are harder to use than the raw operations they wrap
- Boilerplate that grows linearly with each new feature or endpoint

## Pairs Well With

- **Feynman** — Hopper simplifies the system, Feynman verifies the simplification is genuinely clearer
- **Turing** — Hopper identifies what to automate, Turing defines the computational model for it
- **Deming** — Hopper removes accidental complexity, Deming measures the process improvement
- **Lovelace** — Hopper builds reusable abstractions, Lovelace validates they serve real user workflows

## When Not to Over-Apply

- The pattern has only appeared once and may not recur
- Premature abstraction would couple unrelated features behind a shared interface
- The team needs to understand the manual process before automating it
- The cost of building and maintaining the tool exceeds the cost of the repetition
