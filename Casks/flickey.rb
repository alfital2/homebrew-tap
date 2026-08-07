cask "flickey" do
  version "0.5.4"
  sha256 "73a98580979276bbe391d86806f8147a00abeb832877a95eddc50415ccc3ad7e"

  url "https://github.com/alfital2/FlicKey/releases/download/v#{version}/FlicKey.dmg",
      verified: "github.com/alfital2/FlicKey/"
  name "FlicKey"
  desc "Fixes wrong-keyboard-layout typing by converting and switching the layout"
  homepage "https://flickey.site/"

  livecheck do
    url "https://flickey.site/appcast.xml"
    # The appcast carries both the marketing and the build number; the cask is
    # versioned off the git tag, which is the marketing version alone.
    strategy :sparkle do |item|
      item.short_version
    end
  end

  auto_updates true
  depends_on macos: :ventura

  app "FlicKey.app"

  uninstall quit: "com.talalfi.FlicKey"

  zap trash: [
    "~/Library/Caches/com.talalfi.FlicKey",
    "~/Library/HTTPStorages/com.talalfi.FlicKey",
    "~/Library/Preferences/com.talalfi.FlicKey.plist",
  ]
end
