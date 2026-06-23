# typed: false
# frozen_string_literal: true

class Bd < Formula
  desc "Migration shim for the beads Homebrew formula"
  homepage "https://github.com/gastownhall/beads"
  license "MIT"

  deprecate! date: "2026-06-23",
             because: "the supported Homebrew formula is beads",
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
    assert_match "bd version", shell_output("#{Formula["beads"].opt_bin}/bd --version")
  end
end
