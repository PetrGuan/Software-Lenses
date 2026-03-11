---
description: "Analyze APIs using the Liskov mindset: enforce trustworthy behavioral contracts and substitutability."
argument-hint: "[interface, implementation set, or API surface to analyze]"
---

# Liskov Analysis

Canonical mindset spec: `architecture/liskov.md`.

Read that file first, then apply it to `$ARGUMENTS`.

Requirements:
- Follow its diagnostic questions and output format exactly.
- Reference concrete files/functions/lines in the target code.
- Test substitutability by checking if callers can swap implementations without surprises.
