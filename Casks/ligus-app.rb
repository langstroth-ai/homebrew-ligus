cask "ligus-app" do
  # Apple Silicon only: the desktop app ships an aarch64 DMG (no Intel build).
  # TODO(release): placeholder until Ligus v0.1.0 is published. The
  # update-cask workflow rewrites version and replaces the sha256.
  version "0.3.1"
  sha256 "5cde76f95558f9f0bccf4d5154ef091829e6f5bab467d2e1b5e8614fa15ce5fd" # TODO(release)

  url "https://github.com/langstroth-ai/ligus/releases/download/v#{version}/Ligus_#{version}_aarch64.dmg"
  name "Ligus"
  desc "Shared LLM workspace for developers"
  homepage "https://github.com/langstroth-ai/ligus"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

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
