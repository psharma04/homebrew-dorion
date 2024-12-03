cask "dorion" do
  version "6.3.0"

  on_arm do
    sha256 "8fb2b75375ca2e05d97cbae867c69736bd8875bc94316bf0b3b61f6df75069a1"

    url "https://github.com/SpikeHD/Dorion/releases/download/v#{version}/Dorion_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "1ba7413180af33517c1248c1478a672de2039fe903843de8830613b04b451602"

    url "https://github.com/SpikeHD/Dorion/releases/download/v#{version}/Dorion_#{version}_x64.dmg"
  end

  name "Dorion"
  desc "Alternative Discord client aimed towards lower-spec devices"
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

  caveats do
    <<~EOS
      If opening Dorion gives you "Dorion.app is damaged and cannot be opened", MacOS is lying to you and you may just need to run:

        sudo xattr -rd com.apple.quarantine /Applications/Dorion.app

      Alternatively, you can open the Privacy & Security settings pane and scroll down to the Security section to remove the quarantine.
    EOS
  end
end
