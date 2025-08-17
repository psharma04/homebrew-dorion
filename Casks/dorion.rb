cask "dorion" do
  version "6.10.0"

  on_arm do
    sha256 "dcb182187d3813350860139124c32ba4d7ed7a6b6be100e77a3c2f498754cabf"

    url "https://github.com/SpikeHD/Dorion/releases/download/v#{version}/Dorion_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "92d39757010e53855fb927ce62980982970ec4644589fe4a370e2a304f349709"

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
