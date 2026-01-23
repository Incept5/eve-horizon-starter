#!/usr/bin/env bash
set -euo pipefail

echo "=== Checking Eve Stack ==="
eve system health || { echo "Stack not healthy. Start with: eve stack start"; exit 1; }

echo "Stack is running!"
