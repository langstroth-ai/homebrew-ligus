class Ligus < Formula
  desc "Headless Ligus client + agent daemon"
  homepage "https://github.com/langstroth-ai/ligus"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.2.0/ligus-aarch64-apple-darwin"
      sha256 "8a2f271b5fd9a1bd85e9a93b92ea88a23c881c71040e3ac4168f64fc079f3c85"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.2.0/ligus-x86_64-apple-darwin"
      sha256 "59518949b5583ec846ff712c07c9447db0a7f15aa779b217de5a5da7b22e82b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.2.0/ligus-aarch64-unknown-linux-musl"
      sha256 "d22962deabbf45977716d5a3481f04ee74d0d0e6442b1487144b9f72dedcb404"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.2.0/ligus-x86_64-unknown-linux-musl"
      sha256 "606e91fcf3c0748dfbedf1ac3156db4bc9701b532dd19172ea51dda316784e0e"
    end
  end

  def install
    bin.install Dir["ligus-*"].first => "ligus"
  end

  test do
    assert_path_exists bin/"ligus"
  end
end
