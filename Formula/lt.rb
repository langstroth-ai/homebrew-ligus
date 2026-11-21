class Lt < Formula
  desc "Full Ligus client in the terminal (Ligus is short for ligustica)"
  homepage "https://github.com/langstroth-ai/ligus-term"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.1.2/lt-aarch64-apple-darwin"
      sha256 "1ffbb2b2b6dd1410df47c80030f6e0e41abcf74c342ce1c6e3f13188de9f9c2f"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.1.2/lt-x86_64-apple-darwin"
      sha256 "67956d762ace9823a52bdebf12fccdebe2f38af5e659e0683a8b478fd75dfdac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.1.2/lt-aarch64-unknown-linux-musl"
      sha256 "9cab4e9733c80840b392c1b06521ffc83a46e4e85bb74b3f7be0e1c36f31335e"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.1.2/lt-x86_64-unknown-linux-musl"
      sha256 "199df512ee430f6becf90da74e99f6c9959a42e0758e5e309c71b0736521f422"
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
