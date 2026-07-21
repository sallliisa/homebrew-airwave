cask "airwave" do
  version "2.0.1"
  sha256 "b3eddf777923ee2e37517b8d47801a8ed6f5544eaec60e8d8bc3dfa4cd63f0af"

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
