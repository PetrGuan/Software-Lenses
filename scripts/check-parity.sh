#!/usr/bin/env bash
set -euo pipefail

# Validates structural parity between canonical specs, command wrappers, and README.
# Run from the repository root.

errors=0
topic_dirs="architecture debugging evolution performance security strategy testing"

# --- 1. Collect canonical spec basenames ---
canonical_names=()
for dir in $topic_dirs; do
  if [ -d "$dir" ]; then
    for f in "$dir"/*.md; do
      [ -f "$f" ] || continue
      canonical_names+=("$(basename "$f" .md)")
    done
  fi
done
IFS=$'\n' canonical_sorted=($(printf '%s\n' "${canonical_names[@]}" | sort)); unset IFS

# --- 2. Collect command wrapper basenames ---
wrapper_names=()
for f in .claude/commands/*.md; do
  [ -f "$f" ] || continue
  wrapper_names+=("$(basename "$f" .md)")
done
IFS=$'\n' wrapper_sorted=($(printf '%s\n' "${wrapper_names[@]}" | sort)); unset IFS

# --- 3. Check every canonical spec has a wrapper ---
for name in "${canonical_sorted[@]}"; do
  found=false
  for w in "${wrapper_sorted[@]}"; do
    if [ "$w" = "$name" ]; then found=true; break; fi
  done
  if [ "$found" = false ]; then
    echo "ERROR: Canonical spec '$name' has no command wrapper in .claude/commands/"
    errors=$((errors + 1))
  fi
done

# --- 4. Check every wrapper has a canonical spec ---
for name in "${wrapper_sorted[@]}"; do
  found=false
  for c in "${canonical_sorted[@]}"; do
    if [ "$c" = "$name" ]; then found=true; break; fi
  done
  if [ "$found" = false ]; then
    echo "ERROR: Wrapper '$name' has no canonical spec in any topic folder"
    errors=$((errors + 1))
  fi
done

# --- 5. Check each wrapper's canonical path reference resolves ---
for f in .claude/commands/*.md; do
  [ -f "$f" ] || continue
  wrapper_name=$(basename "$f")
  # Extract the path from: Canonical mindset spec: `path/to/file.md`
  spec_path=$(sed -n 's/.*Canonical mindset spec: `\([^`]*\)`.*/\1/p' "$f" | head -1)
  if [ -z "$spec_path" ]; then
    echo "ERROR: Wrapper '$wrapper_name' has no canonical path reference"
    errors=$((errors + 1))
  elif [ ! -f "$spec_path" ]; then
    echo "ERROR: Wrapper '$wrapper_name' references '$spec_path' which does not exist"
    errors=$((errors + 1))
  fi
done

# --- 6. Check README Mindset Index lists every canonical spec ---
if [ -f "README.md" ]; then
  for name in "${canonical_sorted[@]}"; do
    if ! grep -q "$name" README.md; then
      echo "ERROR: Canonical spec '$name' is not referenced in README.md"
      errors=$((errors + 1))
    fi
  done
fi

# --- 7. Check canonical specs have required sections ---
required_sections="When to Use|Core Move|Diagnostic Questions|Output Format|Anti-Patterns This Catches|Pairs Well With|When Not to Over-Apply"
for dir in $topic_dirs; do
  [ -d "$dir" ] || continue
  for f in "$dir"/*.md; do
    [ -f "$f" ] || continue
    spec_name=$(basename "$f")
    IFS='|' read -ra sections <<< "$required_sections"
    for section in "${sections[@]}"; do
      if ! grep -q "^## $section" "$f"; then
        echo "ERROR: Spec '$spec_name' is missing required section '## $section'"
        errors=$((errors + 1))
      fi
    done
  done
done

# --- 8. Check each wrapper has a Requirements block ---
for f in .claude/commands/*.md; do
  [ -f "$f" ] || continue
  wrapper_name=$(basename "$f")
  if ! grep -q "^Requirements:" "$f"; then
    echo "WARNING: Wrapper '$wrapper_name' is missing a Requirements: block"
  fi
done

if [ "$errors" -gt 0 ]; then
  echo ""
  echo "FAILED: $errors parity error(s) found."
  exit 1
else
  echo "OK: All parity checks passed."
fi
