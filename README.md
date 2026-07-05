# Homebrew Beads Tap

This tap is deprecated. The supported Homebrew package for beads is the
`beads` formula in Homebrew core:

```bash
brew install beads
brew upgrade beads
```

The `beads` formula provides the `bd` executable.

## Migrating From The Old Tap Formula

If you previously installed beads from this tap as `bd`, switch to the core
formula:

```bash
brew uninstall bd
brew untap gastownhall/beads 2>/dev/null || true
brew untap steveyegge/beads 2>/dev/null || true
brew install beads
```

The `Formula/bd.rb` file remains only as a migration shim for existing tap
users. It must not package release archives independently of Homebrew core.

For project documentation and releases, see
[gastownhall/beads](https://github.com/gastownhall/beads).
