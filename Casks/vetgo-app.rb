# Written by tinhthanh/shipyard's scripts/homebrew-cask.py for each release
# (fork-release.yml); edits here are overwritten by the next one.
cask "vetgo-app" do
  version "0.3.31-fork.11"
  sha256 "bea514351a6481043871d00f611b65034cbaa974208a847f6a7083b4bf971cd3"

  url "https://github.com/tinhthanh/shipyard/releases/download/v#{version}/Vetgo-macos-universal.zip"
  name "Vetgo"
  desc "Run coding agents on your own boxes (a fork of Shipyard)"
  homepage "https://github.com/tinhthanh/shipyard"

  depends_on macos: :big_sur

  app "Vetgo.app"

  # Signed for development, not notarized: Gatekeeper would refuse the app as
  # downloaded. Taken off once releases are notarized.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Vetgo.app"]
  end

  caveats <<~EOS
    Vetgo carries its own berth CLI and laptop agent. Open the app and start
    the agent there (Start at login keeps it running); `brew install
    tinhthanh/tap/vetgo` adds berth to your PATH, the same version.
    Update the app with `brew upgrade --cask vetgo-app`.
  EOS
end
