cask "airwave" do
  version "2.1.0"
  sha256 "12cbbb17d37e216b3aaaf4b196e4bd8e5d34890cfbf623d1ff44cc0b8d2b4f57"

  url "https://github.com/sallliisa/Airwave/releases/download/v#{version}/Airwave_v#{version}.zip",
      verified: "github.com/sallliisa/Airwave/"
  name "Airwave"
  desc "System-wide spatial audio for macOS"
  homepage "https://github.com/sallliisa/Airwave"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Airwave.app"

  caveats <<~EOS
    Airwave requires System Audio Capture permission and a stereo HRIR preset.
    Output selection and volume remain controlled by macOS.
  EOS

  zap trash: [
    "~/Library/Application Support/Airwave",
    "~/Library/Preferences/com.southneuhof.Airwave.plist",
    "~/Library/Saved Application State/com.southneuhof.Airwave.savedState",
  ]
end
