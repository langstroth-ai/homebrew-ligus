cask "ligus-app" do
  # Apple Silicon only: the desktop app ships an aarch64 DMG (no Intel build).
  # TODO(release): placeholder until Ligus v0.1.0 is published. The
  # update-cask workflow rewrites version and replaces the sha256.
  version "0.1.0"
  sha256 "66d50d0298e1ae897aa006e81bed6953fc1ca88e8af71a1c56ba168b445c47e7" # TODO(release)

  url "https://github.com/langstroth-ai/ligus/releases/download/v#{version}/Ligus_#{version}_aarch64.dmg"
  name "Ligus"
  desc "Shared LLM workspace for developers"
  homepage "https://github.com/langstroth-ai/ligus"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Ligus.app"

  # Remove Ligus's own data on `brew uninstall --zap ligus-app`.
  zap trash: [
    "~/Library/Application Support/ai.ligus.desktop",
    "~/Library/Caches/ai.ligus.desktop",
    "~/Library/Preferences/ai.ligus.desktop.plist",
    "~/Library/Saved Application State/ai.ligus.desktop.savedState",
  ]
end
