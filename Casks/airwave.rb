cask "airwave" do
  version "3.0.0"
  sha256 "17be71a6508b57848438a6788ec9b4db511f2a1efb45257be95e0134b1c989ed"

  url "https://github.com/sallliisa/Airwave/releases/download/v#{version}/Airwave_v#{version}.zip",
      verified: "github.com/sallliisa/Airwave/"
  name "Airwave"
  desc "System-wide audio effects and per-app volume for macOS"
  homepage "https://github.com/sallliisa/Airwave"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Airwave.app"

  caveats <<~EOS
    Airwave requires System Audio Capture permission to process system audio.
    Output selection and volume remain controlled by macOS.
  EOS

  zap trash: [
    "~/Library/Application Support/Airwave",
    "~/Library/Preferences/com.southneuhof.Airwave.plist",
    "~/Library/Saved Application State/com.southneuhof.Airwave.savedState",
  ]
end
