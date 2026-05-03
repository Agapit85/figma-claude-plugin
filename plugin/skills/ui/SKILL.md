---
description: Implements Compose UI from Figma. On first run, analyzes the project and creates FIGMA.md. Use when asked to build a screen or component from a Figma link.
---

## Mode 1: FIGMA.md exists

1. Read `FIGMA.md` from the current project root.
2. Fetch design via get_figma_data using the Figma link from arguments.
3. Determine platform: from arguments → Figma frame data (1280×720 or "tv/TV" in name) → ask.
4. Generate UI code strictly following FIGMA.md rules.

## Mode 2: FIGMA.md not found — project setup

1. Explore the project to understand its structure:
   - Read all .md files in root and `.claude/` directory
   - Find theme/design system files (Colors, Typography, Theme)
   - Find existing UI component directories
   - Detect platforms: search for `tv/` subdirectories in UI layers, TV-specific components,
     or TV-related keywords (FocusRequester, leanback, TvLazyColumn).
     If found → platform includes TV. If not found → Mobile only, skip TV questions.
2. Ask the user clarifying questions (max 3-4), only about what wasn't auto-detected:
   - Confirm detected platforms: "Found TV components — does this project support TV?" (if found)
   - Where are reusable UI components? (if unclear from structure)
   - How are design tokens referenced (colors, typography)?
   - Any platform-specific interaction patterns?
3. Generate `FIGMA.md` in the project root based on findings.
   Include a TV section only if TV platform is confirmed.
4. Confirm with the user, then proceed with Figma design if a link was provided.

## Arguments

$ARGUMENTS
(format: "[figma link]" or "tv|mobile [figma link]")
No Figma link → run setup mode only and create FIGMA.md.
