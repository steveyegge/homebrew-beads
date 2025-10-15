# Homebrew Beads

Homebrew tap for [beads](https://github.com/steveyegge/beads) - an AI-supervised issue tracker for coding workflows.

## Installation

```bash
brew tap steveyegge/beads
brew install bd
```

## Usage

```bash
# Initialize beads in your project
bd init

# Create an issue
bd create "Fix bug in authentication"

# List issues
bd list

# Get help
bd quickstart
```

## About

Beads (`bd`) is an issue tracker designed for AI-supervised coding workflows. It helps developers and AI agents:
- Track work with a simple CLI
- Discover and link related tasks during development
- Maintain context across coding sessions
- Auto-sync issues via JSONL for git workflows

For more information, visit the [main repository](https://github.com/steveyegge/beads).

## Updating

The formula is automatically updated when new versions are tagged in the main repository.

To update to the latest version:

```bash
brew update
brew upgrade bd
```

## License

MIT License - see the [main repository](https://github.com/steveyegge/beads) for details.
