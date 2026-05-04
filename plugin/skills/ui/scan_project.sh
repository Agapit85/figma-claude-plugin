#!/usr/bin/env bash
# Compact project scan for figma:ui setup. Outputs file paths and markers only — no file content.
set -uo pipefail

echo "### MD files (root and .claude/)"
find . -maxdepth 1 -name "*.md" ! -path "./.git/*" 2>/dev/null | sort
find . -maxdepth 2 -path "./.claude/*.md" 2>/dev/null | sort

echo "### Design system files"
find . \( -name "Color*.kt" -o -name "Theme*.kt" -o -name "Typography*.kt" \) \
  ! -path "*/build/*" ! -path "*/.git/*" 2>/dev/null | sort | head -10

echo "### UI directories"
find . -type d \( -name "ui" -o -name "components" -o -name "compose" \) \
  ! -path "*/build/*" ! -path "*/.git/*" 2>/dev/null | sort | head -10

echo "### TV directories"
TV_DIRS=$(find . -type d -name "tv" ! -path "*/build/*" ! -path "*/.git/*" 2>/dev/null)
if [ -n "$TV_DIRS" ]; then echo "$TV_DIRS"; else echo "none"; fi

echo "### TV marker files"
TV_FILES=$(grep -rl "FocusRequester\|TvLazyColumn\|leanback" --include="*.kt" . 2>/dev/null \
  | grep -v "/build/" | head -5)
if [ -n "$TV_FILES" ]; then echo "$TV_FILES"; else echo "none"; fi
