cask "pingmenubar" do
  version "0.0.1"
  sha256 "ef771832a81a2a4096a3c2527e2a686b734e23dd522c0f6f6aaf0ee2d803d1af"

  url "https://github.com/sratabix/ping-menubar/releases/download/v#{version}/PingMenubar-#{version}.zip"
  name "PingMenubar"
  desc "Menubar ping monitor"
  homepage "https://github.com/sratabix/ping-menubar"

  depends_on macos: :ventura

  app "PingMenubar.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/PingMenubar.app"],
                   sudo: false
  end

  zap trash: "~/Library/Preferences/com.pingmenubar.app.plist"

  caveats <<~EOS
    If macOS blocks the app on first launch, approve it under
    System Settings → Privacy & Security.
  EOS
end
