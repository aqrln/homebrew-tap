class DetectFlake < Formula
  desc "Run many instances of the same command in parallel to find abnormal behavior or check if a test is flaky"
  if Hardware::CPU.type == :arm
    url "https://github.com/aqrln/detect_flake/releases/download/v0.5.5/detect_flake-aarch64-apple-darwin.tar.gz"
    sha256 "6c6ffb0baeb23000b138a9889c81a9a80c3cfd10154a95b557c9f8923e03d7fd"
  else
    url "https://github.com/aqrln/detect_flake/releases/download/v0.5.5/detect_flake-x86_64-apple-darwin.tar.gz"
    sha256 "bc07731cf459292551fe6645a9dca263ecca0567f6b38e20e6083f247855588e"
  end
  version "0.5.5"
  license "MIT OR Apache-2.0"

  def install
    bin.install "detect_flake"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
