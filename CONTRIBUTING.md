# Contributing

Thanks for helping improve Software Analysis Mindsets.

## Workflow

1. Fork the repository.
2. Create a feature branch from `main`.
3. Make focused changes with clear commits.
4. Open a pull request against `main`.

Example:

```bash
git clone https://github.com/<your-username>/Software-Lenses.git
cd Software-Lenses
git checkout -b feat/add-lovelace-mindset
```

## What to Contribute

- Add new analysis mindsets under the correct category folder (`architecture/`, `debugging/`, `evolution/`, `performance/`, `security/`, `strategy/`, `testing/`).
- Improve existing mindset files for clarity, accuracy, and practical usefulness.
- Fix broken links, formatting issues, and inconsistencies between command files and docs.

## Content Guidelines

- Keep writing concrete and actionable.
- Use examples tied to real engineering scenarios.
- Keep terminology consistent with existing mindset files.
- Prefer small, reviewable pull requests over large rewrites.

## Source of Truth and Command Format

To avoid duplication:

- Canonical mindset content lives in category folders:
  - `architecture/*.md`
  - `debugging/*.md`
  - `evolution/*.md`
  - `performance/*.md`
  - `security/*.md`
  - `strategy/*.md`
  - `testing/*.md`
- `.claude/commands/*.md` are lightweight wrappers that route to the canonical files.

### Canonical spec schema

Every canonical mindset file must follow this structure:

```md
# [Name] Mindset

> "Quote from or inspired by the thinker."

**Category:** [Category] | **Skill:** `/[skill-name]`

## When to Use          (required — 3-5 bullet points)
## Core Move            (required — the key analytical action)
## Key Concepts         (optional — for mindsets with specific terminology)
## Diagnostic Questions (required — 3-6 questions to guide analysis)
## Output Format        (required — code block with report template)
## Anti-Patterns This Catches (required — 3-5 patterns)
## Pairs Well With      (required — 2-3 complementary mindsets with rationale)
## When Not to Over-Apply (required — 2-3 situations where the mindset doesn't fit)
```

### Command wrapper template

Every wrapper in `.claude/commands/` must include a Requirements block:

```md
---
description: "Analyze [domain] using the [Name] mindset: [what it does]. Use when [scenario]."
argument-hint: "[file, function, or module to analyze]"
---

# [Name] Analysis

Canonical mindset spec: `category/name.md`.

Read that file first, then apply it to `$ARGUMENTS`.

Requirements:
- Follow its diagnostic questions and output format exactly.
- Reference concrete files/functions/lines in the target code.
- [One mindset-specific instruction.]
```

`$ARGUMENTS` is a Claude Code variable that resolves to whatever the user types after the slash command (e.g., `/feynman src/auth.ts` sets `$ARGUMENTS` to `src/auth.ts`).

### Conventions

- Update the canonical file first.
- Keep wrappers short and stable.
- Ensure wrapper path points to the correct canonical file.
- Keep `description` and `argument-hint` clear and concrete.
- Update both README tables (categorized and alphabetical index) when adding a mindset.

## Pull Request Expectations

Before opening a PR, confirm:

- Markdown renders correctly.
- Internal links resolve.
- Added or updated mindset files are reflected in `README.md` when relevant.
- CI checks pass.

## Reporting Issues

Use GitHub issue templates for:

- Bug reports (broken links, formatting, or command behavior)
- New mindset proposals

## Code of Conduct

By participating, you agree to follow `CODE_OF_CONDUCT.md`.
