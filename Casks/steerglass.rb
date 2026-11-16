cask "steerglass" do
  version "0.4.0"
  sha256 "4c4ed6be9eaad83b7e8979d2363d61c36cb4d3eb8ae3f21d08d01947d7111db4"

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
