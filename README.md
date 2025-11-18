# Dotfiles

Personal development environment setup and project workflow scripts.

## Overview

This repository contains reusable scripts and configurations for setting up new projects with a consistent workflow, particularly for working with Claude Code.

## Structure

```
dotfiles/
├── .claude/
│   └── output/
│       └── .gitignore          # Ensures scripts are tracked but output is ignored
├── scripts/
│   └── create-output.sh        # Creates organized output files
├── install.sh                  # Sets up new projects
└── README.md
```

## Installation

### Remote Installation (Recommended)

Install directly from GitHub without cloning:

```bash
# Install to current directory
curl -fsSL https://raw.githubusercontent.com/tjanuki/dotfiles/main/install.sh | bash

# Install to specific directory
curl -fsSL https://raw.githubusercontent.com/tjanuki/dotfiles/main/install.sh | bash -s -- /path/to/your/project
```

**Note:** This syntax works in all shells (bash, zsh, fish, etc.)

### Local Installation

If you have the repository cloned locally:

```bash
cd /path/to/your/project
~/Codes/dotfiles/install.sh
```

Or install to a specific directory:

```bash
~/Codes/dotfiles/install.sh /path/to/your/project
```

### What Gets Installed

- `.claude/output/` directory structure
- `.claude/output/.gitignore` (tracks scripts, ignores output)
- `.claude/output/create-output.sh` script

## Scripts

### create-output.sh

Creates organized output files in a timestamped directory structure.

**Usage:**
```bash
.claude/output/create-output.sh <task_name> <file_name>
```

**Example:**
```bash
.claude/output/create-output.sh user_auth authentication-flow.md
```

**Using with Claude Code:**

When working with Claude Code, you can instruct Claude to output content directly to a new organized file:

```
Output the implementation plan using @.claude/output/create-output.sh payment_gateway implementation-plan
```

This tells Claude to create the file using your organized structure automatically.

**Features:**
- Automatically creates date-based directories (YYYYMMDD)
- Reuses existing directories for the same task on the same day
- Adds `.md` extension if not provided
- Initializes file with UTF-8 encoding instruction

**Output structure:**
```
.claude/output/
└── 20251118/
    └── 20251118_1530_user_auth/
        └── authentication-flow.md
```

## Customization

### Adding New Scripts

1. Add scripts to `scripts/` directory
2. Update `install.sh` to copy them
3. Document in README

### Modifying Templates

Edit the template files in `scripts/` directory. Changes will be applied to new installations.

## Best Practices

1. **Never commit sensitive data** - The .gitignore is set up to ignore output files
2. **Use create-output.sh** - Keep Claude output organized and timestamped
3. **Version control** - Commit script changes but not output files

## Common Workflows

### Starting a New Feature

```bash
# Create output file for planning
.claude/output/create-output.sh payment_integration plan.md

# Work on implementation...
```

### Multiple Tasks in a Day

```bash
# First task
.claude/output/create-output.sh user_auth flow.md
# Creates: .claude/output/20251118/20251118_1530_user_auth/flow.md

# Second file for same task
.claude/output/create-output.sh user_auth database-schema.md
# Reuses: .claude/output/20251118/20251118_1530_user_auth/database-schema.md

# Different task
.claude/output/create-output.sh payment plan.md
# Creates: .claude/output/20251118/20251118_1545_payment/plan.md
```

## Contributing

This is a personal dotfiles repository, but feel free to fork and adapt for your own use.

## License

MIT
