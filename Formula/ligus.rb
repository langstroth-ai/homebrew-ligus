class Ligus < Formula
  desc "Headless Ligus client and agent daemon (formerly hive-cli)"
  homepage "https://github.com/langstroth-ai/ligus"
  # TODO(release): placeholder until Ligus v0.1.0 is published. The release
  # workflow rewrites the URLs and replaces every sha256 below.
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.1.0/ligus-aarch64-apple-darwin"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # TODO(release)
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.1.0/ligus-x86_64-apple-darwin"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # TODO(release)
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.1.0/ligus-aarch64-unknown-linux-musl"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # TODO(release)
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.1.0/ligus-x86_64-unknown-linux-musl"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # TODO(release)
    end
  end

  def install
    bin.install Dir["ligus-*"].first => "ligus"
  end

  test do
    assert_path_exists bin/"ligus"
  end
end
