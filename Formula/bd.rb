# typed: false
# frozen_string_literal: true

class Bd < Formula
  desc "AI-supervised issue tracker for coding workflows"
  homepage "https://github.com/gastownhall/beads"
  version "1.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/beads/releases/download/v1.0.5/beads_1.0.5_darwin_arm64.tar.gz"
      sha256 "648a2d19d767e8700bee809d4667cb52be3443d877dadb8106be550396982f58"
    else
      url "https://github.com/gastownhall/beads/releases/download/v1.0.5/beads_1.0.5_darwin_amd64.tar.gz"
      sha256 "0b0b017a3f2b23a1a9b53056ff160de318ebbca6a991c3db5924f5f48390e490"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/beads/releases/download/v1.0.5/beads_1.0.5_linux_arm64.tar.gz"
      sha256 "ccae5eb4478876ae224687ba98baef46848e603470b241966b63ccd3e01129a4"
    else
      url "https://github.com/gastownhall/beads/releases/download/v1.0.5/beads_1.0.5_linux_amd64.tar.gz"
      sha256 "24706f65c7131c7b3261388709ae8781c8db53f0795398f67aa40538750aacf3"
    end
  end

  def install
    bin.install "bd"
  end
end
