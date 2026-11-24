class Ligus < Formula
  desc "Headless Ligus client + agent daemon"
  homepage "https://github.com/langstroth-ai/ligus"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.2.1/ligus-aarch64-apple-darwin"
      sha256 "96d160e1152a4899b0a732196b164c4c66b08df6b2811c0c7d481d4af0653ec6"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.2.1/ligus-x86_64-apple-darwin"
      sha256 "72639122a385bb3785c7c9d08fec5b17eeff29a5ece5694816110f55f2dbbda8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.2.1/ligus-aarch64-unknown-linux-musl"
      sha256 "4096edb2b2fe270a73d2f13a20e0f7c240cfad014e3f728329da9964f4e244cc"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.2.1/ligus-x86_64-unknown-linux-musl"
      sha256 "ddca93ed0a79c102518ac39621b529d992598ef39e0028a3068191e4a36c843d"
    end
  end

  def install
    bin.install Dir["ligus-*"].first => "ligus"
  end

  test do
    assert_path_exists bin/"ligus"
  end
end
