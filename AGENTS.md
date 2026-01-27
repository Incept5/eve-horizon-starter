# Eve Horizon Starter - Agent Instructions

This is an Eve-compatible starter project. Agents working in this repo should follow these guidelines.

## Project Overview

- **Purpose**: Minimal starter template for Eve-compatible projects
- **Stack**: Staging-first Eve Horizon with Docker Compose for local dev
- **Skills**: eve-se skillpack installed via skills.txt

Local dev runs via Docker Compose and is then translated into `.eve/manifest.yaml` for deployment to the remote staging cluster.

## Key Files

| File | Purpose |
|------|---------|
| `.eve/manifest.yaml` | Deployment configuration (components, envs) |
| `skills.txt` | Skill sources for agents |
| `.eve/hooks/on-clone.sh` | Auto-installs skills on clone |
| `apps/api/` | Example API service |
| `scripts/` | Helper scripts for setup and deploy |

## Common Tasks

### Local dev (Docker Compose)
```bash
docker compose up --build   # http://localhost:3000
```

### Deploy to staging
```bash
./scripts/setup.sh
./scripts/deploy.sh staging
```

### Check deployment
```bash
eve env status staging
```

### Add a new component
1. Add Dockerfile in `apps/<name>/`
2. Add component to `.eve/manifest.yaml`
3. Run `eve env deploy staging --tag <tag>`

## Skills Available

After `eve skills install`, agents have access to:
- eve-se/bootstrap - Org/project setup
- eve-se/manifest-authoring - Manifest editing
- eve-se/deploy-debugging - Troubleshoot deployments
- eve-se/pipelines-workflows - CI/CD configuration

## Development Workflow

1. Make changes to code
2. Test locally: `docker compose up --build`
3. Deploy: `./scripts/deploy.sh staging`
4. Verify: `eve env status staging`

## Keep AGENTS.md Current (Critical)

This file must be rewritten to match the actual product domain and tech stack once the user decides what they are building. The starter API/UI is disposable: expect to replace or remove it entirely. When the real project direction is chosen, document:

- The domain and core product goals.
- The chosen stack and architecture.
- What starter code was removed or replaced, and what (if anything) was kept.
- The new local dev and deploy workflow.
