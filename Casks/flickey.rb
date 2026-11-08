cask "flickey" do
  version "0.7.0"
  sha256 "e6ec308521737ef8b2feca7a76c7807442937f65c93e2b8aa16b383430d6e897"

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
