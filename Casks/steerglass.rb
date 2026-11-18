cask "steerglass" do
  version "0.5.0"
  sha256 "fd73887cb89e956854bc9cf25edb55b5adac1d27d267874b065e5ad1fed8623a"

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
