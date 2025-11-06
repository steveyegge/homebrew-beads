class Bd < Formula
  desc "AI-supervised issue tracker for coding workflows"
  homepage "https://github.com/steveyegge/beads"
  version "0.22.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/steveyegge/beads/releases/download/v#{version}/beads_#{version}_darwin_arm64.tar.gz"
      sha256 "23d06458ab62721a3b90ca0f4b9462ce1cf7535f64a50fa543f349afdbb332f9"
    else
      url "https://github.com/steveyegge/beads/releases/download/v#{version}/beads_#{version}_darwin_amd64.tar.gz"
      sha256 "035cd1d46fe35b78ef2372ae6a0cf50aa9bbd3e4e0b7cbf8760d5de6e7693126"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/steveyegge/beads/releases/download/v#{version}/beads_#{version}_linux_arm64.tar.gz"
      sha256 ""
    else
      url "https://github.com/steveyegge/beads/releases/download/v#{version}/beads_#{version}_linux_amd64.tar.gz"
      sha256 "b1ce87c4e4d44da0014d9397eb597d7b99de4dcc97021b8fe279b2c2a3fa5961"
    end
  end

  def install
    bin.install "bd"
  end

  test do
    system "#{bin}/bd", "version"
  end
end
