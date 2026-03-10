---
description: "Analyze code using the Darwin mindset: evaluate evolutionary fitness, find vestigial structures, and identify what should adapt or go extinct. Use when codebases accumulate dead code, technical debt, or divergent copies of the same logic."
argument-hint: "[file, module, or codebase area to analyze for evolutionary fitness]"
---

# Darwin Analysis

Canonical mindset spec: `evolution/darwin.md`.

Read that file first, then apply it to `$ARGUMENTS`.

Requirements:
- Follow its diagnostic questions and output format exactly.
- Reference concrete files/functions/lines in the target code.
- Distinguish vestigial (remove) from adapted (keep) from accreted (refactor).
