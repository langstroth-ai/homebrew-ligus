class Lt < Formula
  desc "Full Ligus client in the terminal (Ligus is short for ligustica)"
  homepage "https://github.com/langstroth-ai/ligus-term"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.2.1/lt-aarch64-apple-darwin"
      sha256 "ded3a9f0e52070f9a04b2d0f34ab8c15a93e2cfb4c47ebb906c8da91f37cac67"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.2.1/lt-x86_64-apple-darwin"
      sha256 "ed6511ea205bb194772566a29b17887d0a0345ba94c5c8b68d15fec10fb5e4e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.2.1/lt-aarch64-unknown-linux-musl"
      sha256 "583d18f58c4a32fcba506ba6942f3ccafc1cde6223a229b5528e3243532fa41b"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.2.1/lt-x86_64-unknown-linux-musl"
      sha256 "3cd46cf673c99826819816a8a9f0c288b023587c3548d25d24e7236c75931c8d"
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
