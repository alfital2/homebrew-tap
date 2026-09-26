cask "flickey" do
  version "0.6.0"
  sha256 "339ca861650eb0e5bf160f91c3fe3dd1b7fcd8dc6c12fdaf8e5048810c429317"

  url "https://github.com/alfital2/FlicKey/releases/download/v#{version}/FlicKey.dmg"
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
