class Lt < Formula
  desc "Full Ligus client in the terminal (Ligus is short for ligustica)"
  homepage "https://github.com/langstroth-ai/ligus-term"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.1.3/lt-aarch64-apple-darwin"
      sha256 "790ecf137e1a682de9f39df90e77c3ad0addd892aa18d4fb2241e3d6fb15c37b"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.1.3/lt-x86_64-apple-darwin"
      sha256 "a9ee63dc62c4a279bff88193f2fcb6517c0b73eb159b9629bbd5f785488937b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.1.3/lt-aarch64-unknown-linux-musl"
      sha256 "77f1b8e38f83a1610ac17a57f9092feaa4815654080f9a77f2465482a4363dd5"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.1.3/lt-x86_64-unknown-linux-musl"
      sha256 "edef0311a3db040440be6a18ef03f9c23c2cdd4bf74e7610c4447bf1bd7831be"
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
