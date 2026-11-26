class Lt < Formula
  desc "Full Ligus client in the terminal (Ligus is short for ligustica)"
  homepage "https://github.com/langstroth-ai/ligus-term"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.4.0/lt-aarch64-apple-darwin"
      sha256 "1a3c17675547cf83509dfcc3e0889fd3d0d6c5efd5263f9e2d765ed6089a74de"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.4.0/lt-x86_64-apple-darwin"
      sha256 "de1d72a22fe45c9d18b55eb1b2fdbf79f53ef6f8ddd49745e64e6031b99a084e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.4.0/lt-aarch64-unknown-linux-musl"
      sha256 "b9e0f231e691ba83550d9c90906d64ebde8dc41d5cac0f39cc26fa14f7c53247"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.4.0/lt-x86_64-unknown-linux-musl"
      sha256 "daf4e0b9f3131b914dd7e9b0110de1767be72f16d92cda826898a2ccd512504f"
    end
  end

  conflicts_with "localtunnel", because: "both install an `lt` binary"

  def install
    bin.install Dir["lt-*"].first => "lt"
    # The asset downloads without the execute bit, and Homebrew only
    # fixes modes after install: make lt runnable before calling it.
    chmod 0755, bin/"lt"
    # lt prints its completions and man page without a device.
    generate_completions_from_executable(bin/"lt", "completions", shells: [:bash, :zsh, :fish])
    (man1/"lt.1").write Utils.safe_popen_read(bin/"lt", "man")
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
