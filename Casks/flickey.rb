cask "flickey" do
  version "0.5.2"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/alfital2/FlicKey/releases/download/v#{version}/FlicKey.dmg",
      verified: "github.com/alfital2/FlicKey/"
  name "FlicKey"
  desc "Fixes wrong-keyboard-layout typing by converting and switching the layout"
  homepage "https://flickey.site/"

  livecheck do
    url "https://flickey.site/appcast.xml"
    strategy :sparkle
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
