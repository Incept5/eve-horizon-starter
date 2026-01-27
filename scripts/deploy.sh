#!/usr/bin/env bash
set -euo pipefail

ENV=${1:-test}

echo "=== Running CI/CD pipeline for $ENV ==="
eve pipeline run ci-cd-main --env "$ENV"

echo "Deploy complete!"
echo "Access at: http://api.eve-starter-$ENV.lvh.me"
