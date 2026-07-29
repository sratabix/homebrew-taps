cask "awsssh" do
  version "0.0.6"
  sha256 "cfc43015fceef7d1376255af817d24c4ee0d8fa3532cf9e8b19523cc0b1a03ab"

  url "https://github.com/sratabix/awsssh/releases/download/v#{version}/Awsssh-#{version}.zip"
  name "Awsssh"
  desc "Menubar port-forward manager and EC2-over-SSM shell CLI"
  homepage "https://github.com/sratabix/awsssh"

  depends_on cask: "session-manager-plugin"
  depends_on macos: :ventura

  app "Awsssh.app"
  binary "#{appdir}/Awsssh.app/Contents/Resources/awsssh"
  bash_completion "#{appdir}/Awsssh.app/Contents/Resources/completions/awsssh.bash"
  fish_completion "#{appdir}/Awsssh.app/Contents/Resources/completions/awsssh.fish"
  zsh_completion "#{appdir}/Awsssh.app/Contents/Resources/completions/_awsssh"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Awsssh.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Awsssh",
    "~/Library/Preferences/com.github.sratabix.awsssh.plist",
  ]

  caveats <<~EOS
    Awsssh is a menubar app. Launch it from Applications, then use its menubar
    icon to manage port forwards. The `awsssh` CLI (shell into an instance) is
    linked onto your PATH by this cask, along with zsh, bash and fish
    completions.

    Enable "Launch at login" from the menubar panel to start Awsssh with macOS.

    If macOS still blocks the app on first launch, approve it under
    System Settings → Privacy & Security.
  EOS
end
