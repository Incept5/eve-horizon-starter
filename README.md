# Eve Horizon Starter

Start building with Eve Horizon in 5 minutes. Clone, install skills, let AI configure everything.

## Quick Start

### 1. Clone & Rename

```bash
git clone https://github.com/Incept5/eve-horizon-starter my-project
cd my-project
```

### 2. Install Eve Skills

```bash
./bin/install-skills.sh
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

Eve Horizon is a platform for running AI-powered jobs. It can help with:

| Category | Examples |
|----------|----------|
| **CI/CD** | Automated tests, builds, deployments |
| **Code Review** | PR feedback, security scanning |
| **Documentation** | Generate docs, changelogs, READMEs |
| **Development** | Code scaffolding, refactoring, migrations |

## Project Structure

```
my-project/
├── .eve/
│   └── manifest.yaml    # Eve project configuration
├── bin/
│   └── install-skills.sh
├── docs/
│   └── GETTING-STARTED.md
├── skills.txt           # Skillpack references
└── README.md
```

## Common Commands

After setup, you can use these commands:

```bash
# Check auth status
eve auth status

# Sync your Claude/Codex OAuth tokens to Eve
eve auth sync

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
npm install -g @eve/cli
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
version: "1"
project:
  slug: my-project
  name: My Project
  description: What this project does
```

## Troubleshooting

### "eve: command not found"

Install the CLI: `npm install -g @eve/cli`

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
