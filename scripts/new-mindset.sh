#!/usr/bin/env bash
set -euo pipefail

# Scaffolds a new mindset: canonical spec + command wrapper.
# Usage: bash scripts/new-mindset.sh <name> <category>
# Example: bash scripts/new-mindset.sh knuth strategy

NAME="$1"
CATEGORY="$2"
VALID_CATEGORIES="architecture debugging evolution performance security strategy testing"

# Validate category
if ! echo "$VALID_CATEGORIES" | grep -qw "$CATEGORY"; then
  echo "ERROR: Invalid category '$CATEGORY'. Must be one of: $VALID_CATEGORIES"
  exit 1
fi

# Title-case the name for display
DISPLAY_NAME="$(echo "$NAME" | sed 's/\b\(.\)/\u\1/g')"

SPEC_FILE="$CATEGORY/$NAME.md"
WRAPPER_FILE=".claude/commands/$NAME.md"

# Check for conflicts
if [ -f "$SPEC_FILE" ]; then
  echo "ERROR: $SPEC_FILE already exists."
  exit 1
fi
if [ -f "$WRAPPER_FILE" ]; then
  echo "ERROR: $WRAPPER_FILE already exists."
  exit 1
fi

# Create canonical spec
mkdir -p "$CATEGORY"
cat > "$SPEC_FILE" << EOF
# $DISPLAY_NAME Mindset

> "TODO: Add a quote from or inspired by $DISPLAY_NAME."

**Category:** $(echo "$CATEGORY" | sed 's/\b\(.\)/\u\1/g') | **Skill:** \`/$NAME\`

## When to Use

- TODO: When is this mindset most valuable?

## Core Move

TODO: What is the key analytical action?

## Diagnostic Questions

- TODO: What questions guide analysis with this mindset?

## Output Format

\`\`\`
TODO: Define the structured report template
\`\`\`

## Anti-Patterns This Catches

- TODO: What bad patterns does this mindset detect?

## Pairs Well With

- **TODO** — How does this complement another mindset?

## When Not to Over-Apply

- TODO: When should this mindset not be used?
EOF

# Create command wrapper
cat > "$WRAPPER_FILE" << EOF
---
description: "Analyze code using the $DISPLAY_NAME mindset: TODO describe what it does. Use when TODO describe scenario."
argument-hint: "[file, function, or module to analyze]"
---

# $DISPLAY_NAME Analysis

Canonical mindset spec: \`$SPEC_FILE\`.

Read that file first, then apply it to \`\$ARGUMENTS\`.

Requirements:
- Follow its diagnostic questions and output format exactly.
- Reference concrete files/functions/lines in the target code.
- TODO: Add one mindset-specific instruction.
EOF

echo "Created:"
echo "  $SPEC_FILE (canonical spec — fill in the TODOs)"
echo "  $WRAPPER_FILE (command wrapper — update description)"
echo ""
echo "Don't forget to:"
echo "  1. Fill in all TODO sections in $SPEC_FILE"
echo "  2. Update the description in $WRAPPER_FILE"
echo "  3. Add entries to README.md (category table + Mindset Index)"
echo "  4. Run 'make check' to validate"
