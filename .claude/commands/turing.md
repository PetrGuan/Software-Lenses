---
description: "Analyze code using the Turing mindset: convert vague intent into an explicit, executable procedure. Use when requirements sound reasonable but implementation drifts, branches incorrectly, or loops endlessly."
argument-hint: "[file, workflow, or multi-step process to analyze]"
---

# Turing Analysis

Canonical mindset spec: `architecture/turing.md`.

Read that file first, then apply it to `$ARGUMENTS`.

Requirements:
- Follow its diagnostic questions and output format exactly.
- Reference concrete files/functions/lines in the target code.
- Prioritize undefined cases, control-flow drift, and termination guarantees.
