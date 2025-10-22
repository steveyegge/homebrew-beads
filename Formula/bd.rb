class Bd < Formula
  desc "AI-supervised issue tracker for coding workflows"
  homepage "https://github.com/steveyegge/beads"
  url "https://github.com/steveyegge/beads/archive/refs/tags/v0.11.0.tar.gz"
  sha256 "01241de42b8c380f00a36d66750d848325c8979c3b01da5b4018000a005e2b43"
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

    # Test init command
    system bin/"bd", "init", "--prefix=test"
    assert_predicate testpath/".beads/test.db", :exist?

    # Test list command (should show no issues)
    list_output = shell_output("#{bin}/bd list --db=#{testpath}/.beads/test.db")
    assert_match "Found 0 issues", list_output
  end
end
