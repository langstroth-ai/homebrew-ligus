class Ligus < Formula
  desc "Headless Ligus client + agent daemon"
  homepage "https://github.com/langstroth-ai/ligus"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.4.1/ligus-aarch64-apple-darwin"
      sha256 "76b86ab6ae0d8dd808a6f542a0c73222c007dac350613a9413666dcf968d6c4c"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.4.1/ligus-x86_64-apple-darwin"
      sha256 "40684c5d17c8bb170727e37bb04eef3790fab86b9a55174a282cc5dc69e5f6ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.4.1/ligus-aarch64-unknown-linux-musl"
      sha256 "272114b7a890a2da6e8f4853b629f16a070f95f952944ec71007ae2b5f25d41f"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.4.1/ligus-x86_64-unknown-linux-musl"
      sha256 "8ac88f0cb6851ec3a51d99d9b3cfc7c36052afbf86a5d9ccf5c380fd1907ea7c"
    end
  end

  def install
    bin.install Dir["ligus-*"].first => "ligus"
  end

  test do
    assert_path_exists bin/"ligus"
  end
end
