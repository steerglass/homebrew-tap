cask "steerglass" do
  version "0.5.2"
  sha256 "17ce317991d5429da8a3cf099b79b34398908254ac969f5e494657ad8c1faa37"

  url "https://steerglass.com/releases/#{version}/steerglass_#{version}_universal.dmg"
  name "Steerglass"
  desc "Fast desktop client for many Kubernetes clusters"
  homepage "https://steerglass.com/"

  livecheck do
    url "https://steerglass.com/updates/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Steerglass.app"

  zap trash: [
    "~/Library/Application Support/com.steerglass.app",
    "~/Library/Caches/com.steerglass.app",
    "~/Library/Saved Application State/com.steerglass.app.savedState",
    "~/Library/WebKit/com.steerglass.app",
  ]
end
