cask "flickey" do
  version "0.5.3"
  sha256 "9e0272d72d1ce1eb172e50695d4a28200011ef1da31adfb8b41c52a5855478cc"

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
