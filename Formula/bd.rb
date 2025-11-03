class Bd < Formula
  desc "AI-supervised issue tracker for coding workflows"
  homepage "https://github.com/steveyegge/beads"
  url "https://github.com/steveyegge/beads/archive/refs/tags/v0.21.5.tar.gz"
  sha256 "c521217fa682d569398adbcd8a876265ca9e0f0460f5752f165a6fc86545b436"
  license "MIT"
  head "https://github.com/steveyegge/beads.git", branch: "main"

  depends_on "go" => :build

  def install
    # Build the CLI
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=#{version}"), "./cmd/bd"
  end

  test do
    # Test that the binary runs and outputs version
    output = shell_output("#{bin}/bd version")
    assert_match "bd version #{version}", output
  end
end
