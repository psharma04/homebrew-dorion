cask "dorion" do
    version "#{version}"
  
    if Hardware::CPU.intel?
      url "#{download_x64}"
    else
      url "#{download_arm}"
    end
  
    name "Dorion"
    desc "Dorion application"
    homepage "https://github.com/SpikeHD/Dorion"
  
    livecheck do
      url "https://github.com/SpikeHD/Dorion/releases/latest"
      strategy :page_match do |page|
        v = page[%r{href=.*?/Dorion/releases/download/v?(\d+(?:\.\d+)*)/Dorion_.*\.dmg}i, 1]
        v.tr("_", ".")
      end
    end
  
    app "Dorion.app"
  
    auto_updates true
  
    zap trash: [
      "~/Library/Application Support/Dorion",
      "~/Library/Preferences/com.dorion.plist",
      "~/Library/Saved Application State/com.dorion.savedState",
    ]
  end
  