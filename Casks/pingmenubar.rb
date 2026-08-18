cask "pingmenubar" do
  version "0.0.2"
  sha256 "8fd15cf5a73ad20fd3948c8282f579615eaf312f429c48996865669f61024ea1"

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
