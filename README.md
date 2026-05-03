# figma-claude-plugin

Claude Code plugin: Figma → Jetpack Compose UI.

On first run in a new project, automatically analyzes the codebase, asks a few questions, and creates a `FIGMA.md` config file. On subsequent runs, uses `FIGMA.md` to generate accurate UI code.

## Requirements

- [Claude Code](https://claude.ai/code)
- Node.js (for npx)
- Figma personal access token

## Setup

### 1. Figma token

```bash
echo 'export FIGMA_ACCESS_TOKEN=your_token_here' >> ~/.zshrc
source ~/.zshrc
```

Get token: Figma → Settings → Security → Personal access tokens (`file_read` scope).

### 2. Install plugin

```
/plugin marketplace add Agapit85/figma-claude-plugin
/plugin install figma-claude-plugin@figma-claude-plugin
```

## Usage

**First run in a new project** (no `FIGMA.md` yet):

```
/figma:ui
```

The plugin will explore your project, ask a few questions, and create `FIGMA.md`.

**Subsequent runs:**

```
/figma:ui https://figma.com/design/...
```

Platform is detected automatically from Figma frame data. You can also specify it explicitly:

```
/figma:ui tv https://figma.com/design/...
```

## How it works

1. Reads `FIGMA.md` from the current project root for project-specific rules
2. Fetches the design from Figma via [figma-developer-mcp](https://github.com/GLips/Figma-Context-MCP)
3. Generates Compose code following your project's conventions

## FIGMA.md

Each project has its own `FIGMA.md` with rules: design tokens, component paths, platform patterns. The plugin generates this file automatically on first run.

## Versioning

[Semantic Versioning](https://semver.org/). See [CHANGELOG.md](CHANGELOG.md).
