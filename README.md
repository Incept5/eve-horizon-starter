# Eve Horizon Starter

Build self-healing, self-improving applications with **Eve Horizon** — the agentic-native PaaS.

This template gets you started in 5 minutes. Clone, install skills, let AI configure everything.

## Quick Start

### 1. Clone & Rename

```bash
git clone https://github.com/Incept5/eve-horizon-starter my-project
cd my-project
```

### 2. Install Eve CLI & Skills

```bash
npm install -g @eve-horizon/cli
eve skills install
```

This installs skills that help AI coding agents work with Eve Horizon.

### 3. Start Your AI Agent

Open the project in Claude Code, Cursor, or your preferred AI coding agent:

```bash
claude  # or cursor, etc.
```

### 4. Run Setup

Ask your AI agent:

> "Run the eve-new-project-setup skill"

The AI will:
- Install the Eve CLI
- Set up your profile for the staging environment
- Authenticate you (using your GitHub SSH key)
- Configure your project manifest
- Help you set up your own Git remote

**That's it!** Your project is ready to use Eve Horizon.

---

## What Is Eve Horizon?

**Agentic-Native PaaS** — A platform for building and deploying self-healing, self-improving applications.

| Capability | What It Means |
|------------|---------------|
| **Self-healing apps** | AI agents monitor, diagnose, and fix issues automatically |
| **Self-improving systems** | Continuous optimization through agent-driven feedback loops |
| **Native agentic apps** | Build apps where AI agents are first-class runtime components |
| **Agent-first API** | Claude, Codex, and custom agents use the same API as humans |

## Project Structure

```
my-project/
├── .eve/
│   └── manifest.yaml    # Eve project configuration
├── docs/
│   └── GETTING-STARTED.md
├── skills.txt           # Skillpack references
├── AGENTS.md            # Agent instructions (universal)
├── CLAUDE.md            # Claude Code redirect
└── README.md
```

## API Overview

The starter API exposes a minimal todos service:

```bash
GET    /health
GET    /todos
POST   /todos
GET    /todos/:id
PATCH  /todos/:id
DELETE /todos/:id
```

OpenAPI is served at:

```bash
GET /openapi.json
```

## Common Commands

After setup, you can use these commands:

```bash
# Check auth status
eve auth status

# Sync your Claude/Codex OAuth tokens to Eve
eve auth sync

# Run integration tests
./scripts/integration-test.sh

# Run the CI/CD pipeline
eve pipeline run ci-cd-main --env staging

# Validate required secrets and remediation hints
eve project sync --validate-secrets

# Create a job
eve jobs create --prompt "Review the codebase and suggest improvements"

# List your jobs
eve jobs list

# Check job status
eve jobs get <job-id>
```

## Next Steps

1. **Push to your repo**: `git push -u origin main`
2. **Sync OAuth tokens**: `eve auth sync` (uses your Claude/Codex subscriptions)
3. **Create your first job**: `eve jobs create --prompt "Hello Eve!"`
4. **Add secrets**: `eve secrets set MY_API_KEY "value"`

## Manual Setup

If you prefer to set up manually instead of using the AI skill:

### Install CLI

```bash
npm install -g @eve-horizon/cli
```

### Create Profile

```bash
eve profile create staging --api-url https://api.eve-staging.incept5.dev
eve profile set staging --default-email your@email.com
```

### Authenticate

```bash
# Check if bootstrap window is open (first-time setup)
eve auth bootstrap --status

# If open, bootstrap yourself as first admin
eve auth bootstrap --email your@email.com

# Or login if you've been invited
eve auth login
```

### Configure Manifest

Edit `.eve/manifest.yaml`:

```yaml
schema: eve/compose/v2
project: my-project
services:
  api:
    build:
      context: apps/api
```

## Troubleshooting

### "eve: command not found"

Install the CLI: `npm install -g @eve-horizon/cli`

### "Not authenticated"

Run `eve auth login` or check `eve auth bootstrap --status` if you're the first user.

### "No registered SSH key"

The CLI will offer to fetch your keys from GitHub. Or manually register:
```bash
eve admin invite --email your@email.com --github yourusername
```

## Documentation

- [Getting Started Guide](docs/GETTING-STARTED.md)
- [Eve Horizon Docs](https://github.com/Incept5/eve-horizon/tree/main/docs)
- [Eve Skills](https://github.com/Incept5/eve-skillpacks)

## License

MIT
