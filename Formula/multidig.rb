class Multidig < Formula
  desc "See how far a DNS change has propagated"
  homepage "https://github.com/sratabix/multidig"
  license "GPL-2.0-only"

  on_macos do
    on_arm do
      url "https://github.com/sratabix/multidig/releases/download/v0.0.1/multidig_darwin_arm64"
      sha256 "e09059c8e9d1616aabd5bf3b52d6928ac776b1e6949a642e249f3ed9a5156359"
    end
    on_intel do
      url "https://github.com/sratabix/multidig/releases/download/v0.0.1/multidig_darwin_amd64"
      sha256 "dd97eb22100bb1738483592ad0e8bc1d810a966b43f1d91ab3993a0ad12d42bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sratabix/multidig/releases/download/v0.0.1/multidig_linux_arm64"
      sha256 "17fc5bc40521290cfa6967b94509ff694a961fe64e00722498bef92f0ce732e7"
    end
    on_intel do
      url "https://github.com/sratabix/multidig/releases/download/v0.0.1/multidig_linux_amd64"
      sha256 "c1d6483bfe34685e58cdd7ab284c77d88a049956ca4696b14a7357e95281e3ea"
    end
  end

  def install
    bin.install Dir["multidig_*"].first => "multidig"
  end

  test do
    assert_match "multidig #{version}", shell_output("#{bin}/multidig --version")
  end
end
