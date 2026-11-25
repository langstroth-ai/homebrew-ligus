class Lt < Formula
  desc "Full Ligus client in the terminal (Ligus is short for ligustica)"
  homepage "https://github.com/langstroth-ai/ligus-term"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.3.0/lt-aarch64-apple-darwin"
      sha256 "bd5ca3fae4da62172b4698b689e7d20db7436faff7430466c2da5dd956604aca"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.3.0/lt-x86_64-apple-darwin"
      sha256 "521b86107fac08f9887296c4c55a26ff5868bbb04b7a8292fe232824d7c0c56a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.3.0/lt-aarch64-unknown-linux-musl"
      sha256 "58c9ffb8d57dba994f24968a32ff707e5e040a929ae622aec6e7d7ebc7345bc6"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.3.0/lt-x86_64-unknown-linux-musl"
      sha256 "bc94deaa382e523299d912a18230c2a2c83af14304ed64619c86ea6f8f1ab7f2"
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
