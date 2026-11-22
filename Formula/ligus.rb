class Ligus < Formula
  desc "Headless Ligus client + agent daemon"
  homepage "https://github.com/langstroth-ai/ligus"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.1.1/ligus-aarch64-apple-darwin"
      sha256 "245881aaecd17364a0ad1644d67f6392e7a805588e1322783c8561a8eecaba3a"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.1.1/ligus-x86_64-apple-darwin"
      sha256 "cae9a1c2c7c354ba908047192b54f381a470cc6e229bb29b1d2cd2eb133466a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.1.1/ligus-aarch64-unknown-linux-musl"
      sha256 "b36900d3268414f0be9472170279d52ae8c389f7fa4a22b42912976e177f9aaf"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.1.1/ligus-x86_64-unknown-linux-musl"
      sha256 "cfbe099d122bea0e8093d83c25ba9ef60970ca66994915f259534a03f3310b47"
    end
  end

  def install
    bin.install Dir["ligus-*"].first => "ligus"
  end

  test do
    assert_path_exists bin/"ligus"
  end
end
