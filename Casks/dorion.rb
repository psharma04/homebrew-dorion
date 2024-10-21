cask "dorion" do
  version "6.0.0"

  on_arm do
    url "https://github.com/SpikeHD/Dorion/releases/download/v#{version}/Dorion_#{version}_aarch64.dmg"
    sha256 "1c67184aa1b2ab3fcb2a3eed9560a6aa20af6cf57d96aeaa733cd820decee197"
  end
  on_intel do
    url "https://github.com/SpikeHD/Dorion/releases/download/v#{version}/Dorion_#{version}_x64.dmg"
    sha256 "de0c7e0994e2a98681fd87e6e74a340fa5a50a7f89bd8cad0eddc22630773703"
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
