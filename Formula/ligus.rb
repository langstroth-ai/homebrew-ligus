class Ligus < Formula
  desc "Headless Ligus client + agent daemon"
  homepage "https://github.com/langstroth-ai/ligus"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.4.0/ligus-aarch64-apple-darwin"
      sha256 "d99f2f1904ba40dcdf540ee3d064e86b0f2bf66fd3eea7bf589c120a1413628d"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.4.0/ligus-x86_64-apple-darwin"
      sha256 "8181a9238077a401e2fcfccd90135280354933d11237729802d52a7d1bd6e8f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.4.0/ligus-aarch64-unknown-linux-musl"
      sha256 "133048288f6d085edf0ddab56647792c1e2408ada0d7a0b2a404e1e0175e3480"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.4.0/ligus-x86_64-unknown-linux-musl"
      sha256 "be72b5d07d0b713232a232d39f3b3d19af476ba809a4a4e63d4952a972bb1f3f"
    end
  end

  def install
    bin.install Dir["ligus-*"].first => "ligus"
  end

  test do
    assert_path_exists bin/"ligus"
  end
end
