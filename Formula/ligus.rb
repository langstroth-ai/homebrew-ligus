class Ligus < Formula
  desc "Headless Ligus client + agent daemon"
  homepage "https://github.com/langstroth-ai/ligus"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.3.1/ligus-aarch64-apple-darwin"
      sha256 "361aeef7f7da3949dd80276b89f77809a4405c191386cfd6daa61ecad6600e1b"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.3.1/ligus-x86_64-apple-darwin"
      sha256 "fd803ab689da999cf2f1509a45394f775b1c1c0d4f1b60c6fc8eebee0444cd77"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.3.1/ligus-aarch64-unknown-linux-musl"
      sha256 "df45176d60d0ad32d16aebce547f38b7542462d5cff72cd1082a6ba9a2e80ece"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.3.1/ligus-x86_64-unknown-linux-musl"
      sha256 "2cbdcde9bb35e118c5ed03ba105c5333dd0d62c2c0d4b02b619a7b49a4e18a00"
    end
  end

  def install
    bin.install Dir["ligus-*"].first => "ligus"
  end

  test do
    assert_path_exists bin/"ligus"
  end
end
