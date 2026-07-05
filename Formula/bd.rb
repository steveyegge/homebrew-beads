# typed: false
# frozen_string_literal: true

# Migration shim: the supported Homebrew package is the `beads` formula in
# Homebrew core. This formula no longer installs its own `bd` binary; it only
# depends on `beads` (which provides `bd`) and leaves a pointer for existing
# tap users. The `url`/`sha256` reference the last tap release purely so the
# formula has a valid version; the source archive is not built or installed.
class Bd < Formula
  desc "Migration shim for the beads Homebrew formula"
  homepage "https://github.com/gastownhall/beads"
  url "https://github.com/gastownhall/beads/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "60b0ea0399fcb409af41d25b26521a04ed8f8fbcd6a080fff5bb1c84cd7ddbe5"
  license "MIT"

  deprecate! date:                "2026-06-22",
             because:             "the supported Homebrew formula is beads",
             replacement_formula: "beads"

  depends_on "beads"

  def install
    (pkgshare/"README.md").write <<~README
      The bd tap formula is deprecated.

      Use the Homebrew core beads formula instead:

        brew install beads
        brew upgrade beads

      The beads formula provides the bd executable.
    README
  end

  def caveats
    <<~EOS
      This tap formula is only a migration shim.

      Use the Homebrew core formula for future installs and upgrades:
        brew install beads
        brew upgrade beads
    EOS
  end

  test do
    assert_match "bd version", shell_output("#{formula_opt_bin("beads")}/bd --version")
  end
end
