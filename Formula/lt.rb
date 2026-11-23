class Lt < Formula
  desc "Full Ligus client in the terminal (Ligus is short for ligustica)"
  homepage "https://github.com/langstroth-ai/ligus-term"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.2.0/lt-aarch64-apple-darwin"
      sha256 "560ac36eb8e156094f9d534ca6c71c0e649232a827f564505c1381c0f902159d"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.2.0/lt-x86_64-apple-darwin"
      sha256 "42f408926cd4195daac8577726f5b51cbdf884c9d4016211e010cfba4e642589"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.2.0/lt-aarch64-unknown-linux-musl"
      sha256 "8ffb5fc29622ab65408bc94e18f3a4bac1d5f7faad146b9df5c59b0d2ab48762"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus-term/releases/download/v0.2.0/lt-x86_64-unknown-linux-musl"
      sha256 "4f9f9423c98748da05fe8ba82d28a7e1e1b4ef7b3fee48de7154786a59af47ee"
    end
  end

  conflicts_with "localtunnel", because: "both install an `lt` binary"

  def install
    bin.install Dir["lt-*"].first => "lt"
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
