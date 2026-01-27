#!/bin/bash
# Install Eve skills for AI coding agents (Claude Code, Cursor, etc.)

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

echo "Installing Eve skills..."

# Check if openskills is available
if ! command -v openskills &> /dev/null; then
    echo "openskills not found. Installing via npm..."
    npm install -g openskills
fi

# Install skills from eve-skillpacks
cd "$PROJECT_DIR"

if [ -f skills.txt ]; then
    echo "Installing skills from skills.txt..."
    openskills install
else
    echo "No skills.txt found. Creating default..."
    cat > skills.txt << 'SKILLS'
# Eve Starter Skills
# Install eve-se skills for building Eve-compatible projects
https://github.com/incept5/eve-skillpacks/eve-se
SKILLS
    openskills install
fi

echo ""
echo "✅ Eve skills installed!"
echo ""
echo "Start your AI coding agent and ask:"
echo '  "Run the eve-new-project-setup skill"'
echo ""
