cask "dorion" do
  version "6.6.0"

  on_arm do
    sha256 "db4d9049c9ba8d69e35cbe91d54b1a1bde58b2cad1c7e2118e9d6b78d494e9c9"

    url "https://github.com/SpikeHD/Dorion/releases/download/v#{version}/Dorion_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "232ace2ff55bc0d1dfefbe35d2d8a0be1b7477b87925efb8352c6d5feb99f6cb"

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
