cask "pingmenubar" do
  version "0.0.3"
  sha256 "e0ee5d99427431b8a97a8644363ededf8f355cc17de5b5fd73463bb803aee237"

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
