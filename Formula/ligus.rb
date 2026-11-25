class Ligus < Formula
  desc "Headless Ligus client + agent daemon"
  homepage "https://github.com/langstroth-ai/ligus"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.3.0/ligus-aarch64-apple-darwin"
      sha256 "5dd635f8307a2dfff0e4c63ccd4f77ee798a11f48719d01d14376d10cc5cea9d"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.3.0/ligus-x86_64-apple-darwin"
      sha256 "c266b40e274f16d387a4341e3cda840c5a62b164efbc29e84425db2d0cfe4e71"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.3.0/ligus-aarch64-unknown-linux-musl"
      sha256 "b7fe7da3484b4c740db051aa99d3836971b6a5f28353074e9fda76b07e783b18"
    end
    on_intel do
      url "https://github.com/langstroth-ai/ligus/releases/download/v0.3.0/ligus-x86_64-unknown-linux-musl"
      sha256 "715439f899b48569e68fe9f79f56ba3c799792183290ed22926fae77f02117d6"
    end
  end

  def install
    bin.install Dir["ligus-*"].first => "ligus"
  end

  test do
    assert_path_exists bin/"ligus"
  end
end
