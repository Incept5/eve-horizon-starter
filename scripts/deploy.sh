#!/usr/bin/env bash
set -euo pipefail

ENV=${1:-test}

echo "=== Deploying to $ENV ==="
eve env deploy "$ENV" --tag local

echo "Deploy complete!"
echo "Access at: http://api.eve-starter-$ENV.lvh.me"
