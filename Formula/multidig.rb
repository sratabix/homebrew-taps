class Multidig < Formula
  desc "See how far a DNS change has propagated"
  homepage "https://github.com/sratabix/multidig"
  license "GPL-2.0-only"

  on_macos do
    on_arm do
      url "https://github.com/sratabix/multidig/releases/download/v0.0.3/multidig_darwin_arm64"
      sha256 "be059c1c621ab7a1d643a29701bf2d05cbc670622f3afc4a5fb09843c6844a14"
    end
    on_intel do
      url "https://github.com/sratabix/multidig/releases/download/v0.0.3/multidig_darwin_amd64"
      sha256 "c4a2d75a10b6d8097019a517926f762093a110dfa270fe07471b28b8a7f7a24c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sratabix/multidig/releases/download/v0.0.3/multidig_linux_arm64"
      sha256 "5efeb6397857888cde6ceea08acef19617e266dbab4d90981cbba1d48cafbd12"
    end
    on_intel do
      url "https://github.com/sratabix/multidig/releases/download/v0.0.3/multidig_linux_amd64"
      sha256 "88d824e52ba17cb76bdfad9352671f38078bd92b73f52eadb02ae939945a2787"
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
