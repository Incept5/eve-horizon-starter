# Eve Horizon Starter - Agent Instructions

This is an Eve-compatible starter project. Agents working in this repo should follow these guidelines.

## Project Overview

- **Purpose**: Minimal starter template for Eve-compatible projects
- **Stack**: Local k3d cluster with Eve Horizon platform
- **Skills**: eve-se skillpack installed via skills.txt

## Key Files

| File | Purpose |
|------|---------|
| `.eve/manifest.yaml` | Deployment configuration (components, envs) |
| `skills.txt` | Skill sources for agents |
| `.eve/hooks/on-clone.sh` | Auto-installs skills on clone |
| `apps/api/` | Example API service |
| `scripts/` | Helper scripts for setup and deploy |

## Common Tasks

### Deploy locally
```bash
./scripts/setup.sh      # First time only
./scripts/deploy.sh     # Deploy to test env
```

### Check deployment
```bash
eve env status test
curl http://api.eve-starter-test.lvh.me/health
```

### Add a new component
1. Add Dockerfile in `apps/<name>/`
2. Add component to `.eve/manifest.yaml`
3. Run `eve env deploy test --tag local`

## Skills Available

After `eve skills install`, agents have access to:
- eve-se/bootstrap - Org/project setup
- eve-se/manifest-authoring - Manifest editing
- eve-se/deploy-debugging - Troubleshoot deployments
- eve-se/pipelines-workflows - CI/CD configuration

## Development Workflow

1. Make changes to code
2. Test locally: `docker build -t api apps/api && docker run -p 3000:3000 api`
3. Deploy: `./scripts/deploy.sh test`
4. Verify: `curl http://api.eve-starter-test.lvh.me/health`
