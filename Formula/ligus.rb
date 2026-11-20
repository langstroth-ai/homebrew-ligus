class Ligus < Formula
  desc "Headless Ligus client + agent daemon"
  homepage "https://github.com/langstroth-ai/ligus"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.1.0/ligus-aarch64-apple-darwin"
      sha256 "f8903a724a82c1221709dcc25adefa6188afd1d87baf631af2c7e43079ebb421"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.1.0/ligus-x86_64-apple-darwin"
      sha256 "b3276cf263026eade6d72d0715819987a0f9aaa16590622810d10411b509366e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.1.0/ligus-aarch64-unknown-linux-musl"
      sha256 "4e5adbac1d0f67b0567967da64c47d3553727c76b696c4124b25b1b506100391"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.1.0/ligus-x86_64-unknown-linux-musl"
      sha256 "69b2a17b488f85d8ac80c0a76e9dd83e4359e4954dfcad9aab9d512c7033b3e4"
    end
  end

  def install
    bin.install Dir["ligus-*"].first => "ligus"
  end

  test do
    assert_path_exists bin/"ligus"
  end
end
