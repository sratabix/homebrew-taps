class Multidig < Formula
  desc "See how far a DNS change has propagated"
  homepage "https://github.com/sratabix/multidig"
  license "GPL-2.0-only"

  on_macos do
    on_arm do
      url "https://github.com/sratabix/multidig/releases/download/v0.0.2/multidig_darwin_arm64"
      sha256 "3f01f6ecdb3d8208ad921e559c979e1ce50fbad36c101c881efc039cda7e99f6"
    end
    on_intel do
      url "https://github.com/sratabix/multidig/releases/download/v0.0.2/multidig_darwin_amd64"
      sha256 "cc8082863779870a320e8ad301683deade2fc90fceaca412e94a1856d6c2feeb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sratabix/multidig/releases/download/v0.0.2/multidig_linux_arm64"
      sha256 "229447a2d61c71fcaa4e5a6a2c7d72e6fddb31a9f2b0c58ea7c8490ee6cf0f11"
    end
    on_intel do
      url "https://github.com/sratabix/multidig/releases/download/v0.0.2/multidig_linux_amd64"
      sha256 "98b7c67a60b69c84bb088b20b7dc4be7b1aa5cede1c89ae98ca5a0197847ec75"
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
