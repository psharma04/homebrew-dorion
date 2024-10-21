cask "dorion" do
  version "6.2.0"

  on_arm do
    sha256 "6f59f1b5725d08c42394ea42df7587741624927558f3d0e49be0a3f32727d107"

    url "https://github.com/SpikeHD/Dorion/releases/download/v#{version}/Dorion_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "133a24b2cfbfb108b07ff6cad6a75b5da7cb46abc2484c5d92cd22340fdb70b9"

    url "https://github.com/SpikeHD/Dorion/releases/download/v#{version}/Dorion_#{version}_x64.dmg"
  end

  name "Dorion"
  desc "Application for managing backups and synchronization"
  homepage "https://github.com/SpikeHD/Dorion"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "Dorion.app"

  zap trash: [
    "~/Library/Application Support/Dorion",
    "~/Library/Preferences/com.dorion.plist",
    "~/Library/Saved Application State/com.dorion.savedState",
  ]
end
