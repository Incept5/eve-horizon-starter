# Eve Horizon Starter

A ready-to-use template for building Eve-compatible applications with local-first development, agent skills pre-configured, and a smooth path to production deployment.

## What This Repo Is

This is an **Eve-compatible starter project** that provides:

- A minimal Eve manifest (`.eve/manifest.yaml`) with example components and environments
- Pre-configured skills installation via `skills.txt` (includes `eve-se` skillpack)
- Git hooks for automated setup (`.eve/hooks/on-clone.sh`)
- A simple example application to validate end-to-end deployment
- Local stack configuration with an easy upgrade path to cloud

## Prerequisites

Before you begin, ensure you have:

- **Docker Desktop** with 8GB+ memory and 4+ CPUs allocated
- **k3d** for local Kubernetes clusters (`brew install k3d` on macOS)
- **kubectl** for Kubernetes cluster management (`brew install kubectl`)
- **Node.js** 18+ for running the CLI and example app (`brew install node`)

## Quick Start

### 1. Clone the Repo

```bash
git clone https://github.com/incept5/eve-horizon-starter.git
cd eve-horizon-starter
```

### 2. Install the Eve CLI

Choose one of these options:

```bash
# Option A: Install globally (recommended)
npm install -g @eve/cli

# Option B: Use npx (no install required)
# Just prefix all `eve` commands with `npx @eve/cli`
```

### 3. Install Skills

The repo includes a `skills.txt` file that references the `eve-se` skillpack. Install skills for AI agents working in this repo:

```bash
eve skills install
```

This reads `skills.txt` and installs skills into `.agent/skills/` (gitignored).

### 4. Start the Local Eve Stack

Eve Horizon runs on Kubernetes. Start a local k3d cluster with Eve deployed:

> **Note:** You need a local copy of the [Eve Horizon](https://github.com/incept5/eve-horizon) repo to run the stack. Clone it alongside this repo if you haven't already.

```bash
# In the eve-horizon repo directory
cd ../eve-horizon

# Start k3d cluster and deploy Eve platform
./bin/eh k8s start
./bin/eh k8s deploy

# Set the API URL (no port-forwarding needed!)
export EVE_API_URL=http://api.eve.lvh.me

# Return to the starter repo
cd ../eve-horizon-starter
```

For detailed instructions, see the [Eve Horizon Quick Start](https://github.com/incept5/eve-horizon#quick-start-local-k8s).

### 5. Create an Organization and Project

```bash
# Create an organization
eve org ensure "My Company"

# Set it as your default org
eve profile set --org org_MyCompany

# Create a project for this repo
eve project ensure \
  --name "Starter App" \
  --slug starter \
  --repo-url https://github.com/yourusername/eve-horizon-starter \
  --branch main

# Set it as your default project (replace with actual project ID from output)
eve profile set --project proj_xxx
```

### 6. Sync and Deploy

```bash
# Sync the manifest to create environments and components
eve project sync

# Deploy to the staging environment
eve env deploy proj_xxx staging --tag local

# Access your deployed app via Ingress
open http://web.starter-staging.lvh.me
```

**URL Pattern:** `{component}.{project}-{env}.lvh.me`

## Local vs Cloud

### Local Stack (Default)

This starter is configured for local development by default:

- **API URL:** `http://api.eve.lvh.me` (k3d Ingress)
- **Deployment target:** Local k3d cluster
- **Auth:** OAuth tokens extracted from your local machine

### Cloud Stack (Future)

To use a hosted Eve instance:

```bash
# Switch to cloud profile
eve profile set --api-url https://api.eve.example.com

# Authenticate with the cloud instance
eve auth login
```

The CLI supports multiple profiles. See `eve profile --help` for details.

## What's Included

```
eve-horizon-starter/
├── .eve/
│   ├── manifest.yaml          # Eve deployment configuration
│   └── hooks/
│       └── on-clone.sh         # Auto-install skills on repo clone
├── skills.txt                  # Skillpack references (eve-se)
├── app/                        # Example application code
│   ├── api/                    # Backend service
│   └── web/                    # Frontend service
├── .gitignore                  # Excludes .agent/skills/ and .claude/skills/
└── README.md                   # This file
```

### Skills Installed

The `eve-se` skillpack includes:

- **eve-se/bootstrap:** Org/project setup and profile defaults
- **eve-se/manifest-authoring:** Components, environments, and secrets
- **eve-se/pipelines-workflows:** Define and run CI/CD workflows
- **eve-se/deploy-debugging:** Diagnose deployment and job issues
- **eve-se/auth-and-secrets:** Token extraction and secret wiring

These skills help AI agents (like Claude Code or Codex) work effectively in Eve-compatible repos.

## Running AI Jobs

Once your project is set up, you can run AI-driven jobs:

```bash
# Create a job
eve job create --description "Review the auth flow and suggest improvements"

# Follow job progress in real-time
eve job follow starter-a3f2dd12

# View job results
eve job result starter-a3f2dd12
```

## Next Steps

- **Customize the manifest:** Edit `.eve/manifest.yaml` to add components, environments, and secrets.
- **Add your application code:** Replace the example app in `app/` with your own services.
- **Configure secrets:** Use `eve secret set` to add API keys and credentials.
- **Set up pipelines:** Define build and deploy workflows in your manifest.
- **Deploy to staging:** Use `eve env deploy` to deploy updates.
- **Deploy to production:** Create a `production` environment and deploy with confidence.

## Common Commands

```bash
# Check system health
eve system health

# List projects
eve project list

# View environment status
eve env list

# View deployment logs
eve job logs <job-id>

# Diagnose a failed deployment
eve job diagnose <job-id>

# Update secrets
eve secret set --project proj_xxx API_KEY "your-key-here"
```

## Documentation

- [Eve Horizon Docs](https://github.com/incept5/eve-horizon/tree/main/docs)
- [Manifest Reference](https://github.com/incept5/eve-horizon/blob/main/docs/system/manifest.md)
- [Job CLI Reference](https://github.com/incept5/eve-horizon/blob/main/docs/system/job-cli.md)
- [Secrets Management](https://github.com/incept5/eve-horizon/blob/main/docs/system/secrets.md)

## Troubleshooting

### "Cannot connect to API"

Ensure the local stack is running:

```bash
cd ../eve-horizon
./bin/eh k8s status

# If not running, start it:
./bin/eh k8s start
./bin/eh k8s deploy
```

### "Skills not found"

Re-run the skills install:

```bash
eve skills install
```

### "Deployment failed"

Check job logs for details:

```bash
eve job diagnose <job-id>
eve job logs <job-id>
```

## Contributing

This starter repo is maintained alongside the [Eve Horizon platform](https://github.com/incept5/eve-horizon). Issues and pull requests are welcome.

## License

Proprietary - Incept5
