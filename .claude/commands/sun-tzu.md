---
description: "Analyze code using the Sun Tzu mindset: think like an attacker, map trust boundaries, and find security blind spots. Use when code handles user input, auth, or sensitive data without explicit threat modeling."
argument-hint: "[file, endpoint, auth flow, or attack surface to analyze]"
---

# Sun Tzu Analysis

Canonical mindset spec: `security/sun-tzu.md`.

Read that file first, then apply it to `$ARGUMENTS`.

Requirements:
- Follow its diagnostic questions and output format exactly.
- Reference concrete files/functions/lines in the target code.
- Think adversarially — show attack paths, not just checklist items.
