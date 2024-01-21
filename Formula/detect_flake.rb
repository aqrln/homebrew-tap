class DetectFlake < Formula
  desc "Run many instances of the same command in parallel to find abnormal behavior or check if a test is flaky"
  version "0.5.6"
  on_macos do
    on_arm do
      url "https://github.com/aqrln/detect_flake/releases/download/v0.5.6/detect_flake-aarch64-apple-darwin.tar.gz"
      sha256 "f70ac88766b65fe954b9ec35dc393fd9f444674457666af57d514aee41ce1b25"
    end
    on_intel do
      url "https://github.com/aqrln/detect_flake/releases/download/v0.5.6/detect_flake-x86_64-apple-darwin.tar.gz"
      sha256 "adbe0e1462896f9b8e896a0a3f9f661bd57608bdb15deaeac074f54b6cc9460d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/aqrln/detect_flake/releases/download/v0.5.6/detect_flake-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2689f2cf455d971af682cc2c88f2836fd63d4e90aea1631332fdb8807b98e32f"
    end
    on_intel do
      url "https://github.com/aqrln/detect_flake/releases/download/v0.5.6/detect_flake-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "705e5cec9cb833f62667160b1881ec247bb49a3bdf1a07724169dd9328b21d9a"
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
