cask "dorion" do
  version "6.0.0"

  if Hardware::CPU.intel?
    url "https://github.com/SpikeHD/Dorion/releases/download/v#{version}/Dorion_#{version}_x64.dmg"
  else
    url "https://github.com/SpikeHD/Dorion/releases/download/v#{version}/Dorion_#{version}_aarch64.dmg"
  end

  name "Dorion"
  desc "Dorion application"
  homepage "https://github.com/SpikeHD/Dorion"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Dorion.app"

  auto_updates true

  zap trash: [
    "~/Library/Application Support/Dorion",
    "~/Library/Preferences/com.dorion.plist",
    "~/Library/Saved Application State/com.dorion.savedState",
  ]
end
