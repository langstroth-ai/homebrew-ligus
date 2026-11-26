class Lt < Formula
  desc "Full Ligus client in the terminal (Ligus is short for ligustica)"
  homepage "https://github.com/langstroth-ai/ligus-term"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.3.1/lt-aarch64-apple-darwin"
      sha256 "1fc6b18b481a8894de43d3372a4b822b35346918f89a5e3c8f30e24f2e26e69c"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.3.1/lt-x86_64-apple-darwin"
      sha256 "397ed2172789fa0f8bb82a0ae66411e4ee230feb65600b440e21c4ed8df26c0a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.3.1/lt-aarch64-unknown-linux-musl"
      sha256 "ed2030973d1708406ad59533d4d0fec3c34077fada14280e81660a99ced4aca9"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.3.1/lt-x86_64-unknown-linux-musl"
      sha256 "eb5ac87b777551ac60ea1a4a764867ac34d80630319da74cff29b431cdea4432"
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
