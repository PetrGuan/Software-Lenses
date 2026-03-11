# Polya Mindset

> "When stuck, reformulate and reduce the problem."

**Category:** Testing | **Skill:** `/polya`

## When to Use

- Root cause is unclear after first-pass investigation
- Test failures are broad and noisy
- Complex defects need a disciplined attack plan

## Core Move

Understand the problem, plan a strategy, execute in small steps, and review what worked.

## Output Format

```
Problem Restatement:
  [exact failure in plain language]

Subproblem Plan:
  [ordered hypotheses/experiments]

Evidence Log:
  [result of each step]

Final Explanation:
  [root cause and validated fix]
```

## Diagnostic Questions

- Can I restate the problem precisely enough that someone else could reproduce it?
- Is there a simpler, related problem I already know how to solve?
- Which subproblems can I test independently to narrow the search space?
- Have I checked whether this problem is analogous to one I have seen before?
- After solving, can I explain why the fix works and not just that it works?

## Anti-Patterns This Catches

- Shotgun debugging — changing many things at once and hoping something sticks
- Skipping problem definition and jumping straight to guessing solutions
- Failing to decompose a broad test failure into independent hypotheses
- Ignoring analogies to known bugs that share the same structural shape
- Declaring victory without verifying the fix against the original problem statement

## Pairs Well With

- **Feynman** — Polya decomposes the problem, Feynman forces each piece to be explained plainly
- **Dijkstra** — Polya plans the attack strategy, Dijkstra enforces rigor in each step
- **Popper** — Polya generates hypotheses, Popper designs experiments to falsify them
- **Hoare** — Polya structures the investigation, Hoare supplies the formal contracts to verify against

## When Not to Over-Apply

- The root cause is already obvious and the fix is straightforward
- Over-decomposition would create busywork for a problem that yields to direct inspection
- The defect is environmental or configuration-based and does not require stepwise reasoning
