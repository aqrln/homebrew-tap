class DetectFlake < Formula
  desc "Run many instances of the same command in parallel to find abnormal behavior or check if a test is flaky"
  version "0.6.0"
  on_macos do
    on_arm do
      url "https://github.com/aqrln/detect_flake/releases/download/v0.6.0/detect_flake-aarch64-apple-darwin.tar.gz"
      sha256 "fa256c421802c29a2b369ebd2463ba456884a4632bc569c8a997467b23d75ef9"
    end
    on_intel do
      url "https://github.com/aqrln/detect_flake/releases/download/v0.6.0/detect_flake-x86_64-apple-darwin.tar.gz"
      sha256 "e5f08756926701e04b992d5078aa44558bec8083ad1a30b24bedd59ad23b5142"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/aqrln/detect_flake/releases/download/v0.6.0/detect_flake-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "89cc952bb3993a370a3c9f1df6996356382589a9eba658afbc430e85116fc9d3"
    end
    on_intel do
      url "https://github.com/aqrln/detect_flake/releases/download/v0.6.0/detect_flake-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d25263d62019eff399a8d4b65ed7cf2df764c466c5a7527c6de9c7e42ab20ff7"
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
