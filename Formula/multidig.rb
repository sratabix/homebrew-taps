class Multidig < Formula
  desc "See how far a DNS change has propagated"
  homepage "https://github.com/sratabix/multidig"
  license "GPL-2.0-only"

  on_macos do
    on_arm do
      url "https://github.com/sratabix/multidig/releases/download/v0.0.4/multidig_darwin_arm64"
      sha256 "a7a3a14ee4aea18cf046be584438bd02d28c33b0d96be21dcb781015070f0d54"
    end
    on_intel do
      url "https://github.com/sratabix/multidig/releases/download/v0.0.4/multidig_darwin_amd64"
      sha256 "fda7dadc40006fb3cfbf64f0f6e937efa8660af85327fedfeaf03dd4ca4c7838"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sratabix/multidig/releases/download/v0.0.4/multidig_linux_arm64"
      sha256 "b0d46fa36c5c4ebc767a380cfce7c42c112ea4e1a682e2d76260863191a1417b"
    end
    on_intel do
      url "https://github.com/sratabix/multidig/releases/download/v0.0.4/multidig_linux_amd64"
      sha256 "436a80a998210f16b7ed3fa16a9ea2cb010124fd8db9e4221f5afb3c484b58f2"
    end
  end

  def install
    bin.install Dir["multidig_*"].first => "multidig"
    (bin/"multidig").chmod 0755
    generate_completions_from_executable(bin/"multidig", "completion")
  end

  test do
    assert_match "multidig #{version}", shell_output("#{bin}/multidig --version")
    assert_match "complete -F _multidig multidig", (bash_completion/"multidig").read
    assert_match "#compdef multidig", (zsh_completion/"_multidig").read
    assert_match "complete -c multidig", (fish_completion/"multidig.fish").read
  end
end
