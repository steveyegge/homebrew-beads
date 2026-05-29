# typed: false
# frozen_string_literal: true

class Bd < Formula
  desc "AI-supervised issue tracker for coding workflows"
  homepage "https://github.com/gastownhall/beads"
  version "1.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/beads/releases/download/v1.0.4/beads_1.0.4_darwin_arm64.tar.gz"
      sha256 "0c53479fea070a1cabe8eb31e3824d74c5643b1deca71a5fe832ebd38e9ef877"
    else
      url "https://github.com/gastownhall/beads/releases/download/v1.0.4/beads_1.0.4_darwin_amd64.tar.gz"
      sha256 "8a52f7e54fe038d369cc9ea0e65f76853b75f5469c70c9c693d64671623c4ce9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/beads/releases/download/v1.0.4/beads_1.0.4_linux_arm64.tar.gz"
      sha256 "48cdf571cd8b64bae81da829c1309e402bc12e6a4cc6b87606dfc9220b7ece60"
    else
      url "https://github.com/gastownhall/beads/releases/download/v1.0.4/beads_1.0.4_linux_amd64.tar.gz"
      sha256 "643e602e27f666c8726abff0f22001e2b5883988fa960204bde20a3129d448a5"
    end
  end

  def install
    bin.install "bd"
  end
end
