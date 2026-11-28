# Written by tinhthanh/shipyard's scripts/homebrew-cask.py for each release
# (fork-release.yml); edits here are overwritten by the next one.
cask "vetgo-app" do
  version "0.3.31-fork.13"
  sha256 "40d01c0609371c6bcea6babf21ec59eff81d55adff4debfe2a84d87a1ff781f2"

  url "https://github.com/tinhthanh/shipyard/releases/download/v#{version}/Vetgo-macos-universal.zip"
  name "Vetgo"
  desc "Run coding agents on your own boxes (a fork of Shipyard)"
  homepage "https://github.com/tinhthanh/shipyard"

  depends_on :macos

  app "Vetgo.app"

  # Signed for development, not notarized: Gatekeeper would refuse the app as
  # downloaded. Taken off once releases are notarized.
  postflight_steps default_base: :appdir do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "Vetgo.app"],
        chdir:          ".",
        writable_paths: ["Vetgo.app"]
  end

  caveats <<~EOS
    Vetgo carries its own berth CLI and laptop agent. Open the app and start
    the agent there (Start at login keeps it running); `brew install
    tinhthanh/tap/vetgo` adds berth to your PATH, the same version.
    Update the app with `brew upgrade --cask vetgo-app`.
  EOS
end
