class Bd < Formula
  desc "AI-supervised issue tracker for coding workflows"
  homepage "https://github.com/steveyegge/beads"
  url "https://github.com/steveyegge/beads/archive/refs/tags/v0.17.2.tar.gz"
  sha256 "8b7f950823d2c0c8f6152c230eefdc67b268cc878e318da6a0fb8093b0f0c1a3"
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
