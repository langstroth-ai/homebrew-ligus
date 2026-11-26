class Lt < Formula
  desc "Full Ligus client in the terminal (Ligus is short for ligustica)"
  homepage "https://github.com/langstroth-ai/ligus-term"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.4.1/lt-aarch64-apple-darwin"
      sha256 "4d4f538812f8a632013f05c28e3b51c5b5f0b713a93d8c46f0965329fb0ca7fc"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.4.1/lt-x86_64-apple-darwin"
      sha256 "71bdee187515d1f9db952430a0363946936894c569ecd398059d24fcdf0209c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.4.1/lt-aarch64-unknown-linux-musl"
      sha256 "234c28a84abe24790a4e01533315502fdf543815bcc1fc68dd2428c9c5612086"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.4.1/lt-x86_64-unknown-linux-musl"
      sha256 "afdee7796e43ed6914a896e204b45825812af3d6573ce02967a5877c9fd6ac78"
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
