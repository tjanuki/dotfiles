#!/bin/bash

# Installation script for dotfiles
# Usage: ./install.sh [target_directory]
#
# This script sets up a new project with:
# - .claude/output directory structure
# - create-output.sh script

set -e  # Exit on error

# Determine target directory
if [ -z "$1" ]; then
    TARGET_DIR="."
else
    TARGET_DIR="$1"
fi

# Get absolute path
TARGET_DIR=$(cd "$TARGET_DIR" && pwd)

echo "🚀 Installing dotfiles to: $TARGET_DIR"
echo ""

# Create .claude/output directory
if [ ! -d "$TARGET_DIR/.claude/output" ]; then
    echo "📁 Creating .claude/output directory..."
    mkdir -p "$TARGET_DIR/.claude/output"
else
    echo "✓ .claude/output directory already exists"
fi

# Copy .gitignore
if [ ! -f "$TARGET_DIR/.claude/output/.gitignore" ]; then
    echo "📋 Copying .claude/output/.gitignore..."
    cp "$(dirname "$0")/.claude/output/.gitignore" "$TARGET_DIR/.claude/output/.gitignore"
else
    echo "✓ .claude/output/.gitignore already exists"
fi

# Copy create-output.sh
if [ ! -f "$TARGET_DIR/.claude/output/create-output.sh" ]; then
    echo "📝 Installing create-output.sh..."
    cp "$(dirname "$0")/scripts/create-output.sh" "$TARGET_DIR/.claude/output/create-output.sh"
    chmod +x "$TARGET_DIR/.claude/output/create-output.sh"
else
    echo "✓ create-output.sh already exists"
fi

echo ""
echo "✨ Installation complete!"
echo ""
echo "Next steps:"
echo "  Use create-output.sh to create organized output files:"
echo "  .claude/output/create-output.sh <task_name> <file_name>"
echo ""
