#!/bin/bash

# Installation script for dotfiles
# Usage: ./install.sh [target_directory]
# Or: bash <(curl -fsSL https://raw.githubusercontent.com/tjanuki/dotfiles/main/install.sh)
#
# This script sets up a new project with:
# - .claude/output directory structure
# - create-output.sh script

set -e  # Exit on error

# GitHub repository base URL for raw files
GITHUB_RAW_URL="https://raw.githubusercontent.com/tjanuki/dotfiles/main"

# Determine if running locally or remotely
SCRIPT_DIR="$(dirname "$0")"
if [ -f "$SCRIPT_DIR/.claude/output/.gitignore" ]; then
    REMOTE_MODE=false
    echo "📦 Running in local mode"
else
    REMOTE_MODE=true
    echo "☁️  Running in remote mode (downloading from GitHub)"
fi

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

# Copy or download .gitignore
if [ ! -f "$TARGET_DIR/.claude/output/.gitignore" ]; then
    echo "📋 Installing .claude/output/.gitignore..."
    if [ "$REMOTE_MODE" = true ]; then
        curl -fsSL "$GITHUB_RAW_URL/.claude/output/.gitignore" -o "$TARGET_DIR/.claude/output/.gitignore"
    else
        cp "$SCRIPT_DIR/.claude/output/.gitignore" "$TARGET_DIR/.claude/output/.gitignore"
    fi
else
    echo "✓ .claude/output/.gitignore already exists"
fi

# Copy or download create-output.sh
if [ ! -f "$TARGET_DIR/.claude/output/create-output.sh" ]; then
    echo "📝 Installing create-output.sh..."
    if [ "$REMOTE_MODE" = true ]; then
        curl -fsSL "$GITHUB_RAW_URL/scripts/create-output.sh" -o "$TARGET_DIR/.claude/output/create-output.sh"
    else
        cp "$SCRIPT_DIR/scripts/create-output.sh" "$TARGET_DIR/.claude/output/create-output.sh"
    fi
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
