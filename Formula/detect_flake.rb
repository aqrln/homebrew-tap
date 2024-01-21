class DetectFlake < Formula
  desc "Run many instances of the same command in parallel to find abnormal behavior or check if a test is flaky"
  version "0.5.7"
  on_macos do
    on_arm do
      url "https://github.com/aqrln/detect_flake/releases/download/v0.5.7/detect_flake-aarch64-apple-darwin.tar.gz"
      sha256 "211657f3007a97a8dd23c71f49b0fffb2925cb1406ee7e4cc82fc934d47fc92b"
    end
    on_intel do
      url "https://github.com/aqrln/detect_flake/releases/download/v0.5.7/detect_flake-x86_64-apple-darwin.tar.gz"
      sha256 "c1da0b64b9a4fe8463db4b89967999e8cc55142b473db4d3eb7e6ae96799e8a1"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/aqrln/detect_flake/releases/download/v0.5.7/detect_flake-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "41440b2492be321f709a7f316c5abb7d39368e4a2c650ad50b7ab36dec8db30f"
    end
    on_intel do
      url "https://github.com/aqrln/detect_flake/releases/download/v0.5.7/detect_flake-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "55594c48bfeef1c651b2e4da1148d7e49b0b8986645095e8411d5ac0c4634f12"
    end
  end
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
