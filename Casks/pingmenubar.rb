cask "pingmenubar" do
  version "0.0.4"
  sha256 "07648122e5bb9e96e0fe59dfa6c1cfd80ab86345b091b80a25dbac9355b3417c"

  url "https://github.com/sratabix/ping-menubar/releases/download/v#{version}/PingMenubar-#{version}.zip"
  name "PingMenubar"
  desc "Menubar ping monitor"
  homepage "https://github.com/sratabix/ping-menubar"

  depends_on macos: :ventura

  app "PingMenubar.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/PingMenubar.app"]
  end

  zap trash: "~/Library/Preferences/com.pingmenubar.app.plist"

  caveats <<~EOS
    If macOS blocks the app on first launch, approve it under
    System Settings → Privacy & Security.
  EOS
end
