class Lt < Formula
  desc "Full Ligus client in the terminal (Ligus is short for ligustica)"
  homepage "https://github.com/langstroth-ai/ligus-term"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.1.1/lt-aarch64-apple-darwin"
      sha256 "5378182a0b8eba98a2e0e2d315d4f09b0d0de4eac200f2353a93660bff3695fe"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.1.1/lt-x86_64-apple-darwin"
      sha256 "553d410b6d6abb49ca0c6a12c005cfdc16d6343583340240f74ac6f26da9ef91"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.1.1/lt-aarch64-unknown-linux-musl"
      sha256 "43031316b3718cfb703b5b1480dc48655a445d7d2f2db9acf1ecc159ba047f2c"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.1.1/lt-x86_64-unknown-linux-musl"
      sha256 "c10447ec90ec91a2054ffe9a7b50f6a0a5c47604e4cf29ce5beb355328b1d8a5"
    end
  end

  conflicts_with "localtunnel", because: "both install an `lt` binary"

  def install
    bin.install Dir["lt-*"].first => "lt"
  end

  def caveats
    <<~EOS
      lt keeps its data in ~/.ligus-term (or --data-dir / $LT_DATA_DIR).
      Try it without touching any data: lt --demo
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lt --version")
  end
end
