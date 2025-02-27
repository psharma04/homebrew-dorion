cask "dorion" do
  version "6.5.0"

  on_arm do
    sha256 "d57cfcab1582989cbecb92621832244031d5450611647804350c01c39debacd6"

    url "https://github.com/SpikeHD/Dorion/releases/download/v#{version}/Dorion_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "d9fcd5afcd0e67b7f4bdce1920b91d2e748b9b34c809a0decbac6ab7c9fe656b"

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
