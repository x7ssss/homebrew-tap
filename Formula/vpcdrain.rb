class Vpcdrain < Formula
  desc "Deterministic 8-tier ephemeral AWS VPC sweeper with distributed DynamoDB locking"
  homepage "https://github.com/x7ssss/vpcdrain"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/x7ssss/vpcdrain/releases/download/v1.0.0/vpcdrain_darwin_arm64"
      sha256 "cddd58695a2e0a783814d28aea2e31b63c6fa1182ab64889c781947416e270a3"
    else
      url "https://github.com/x7ssss/vpcdrain/releases/download/v1.0.0/vpcdrain_darwin_amd64"
      sha256 "a8584b11fd461c0050a68d2141b54d1942cfb2d916eebdbbee322c1ef6b03c0b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/x7ssss/vpcdrain/releases/download/v1.0.0/vpcdrain_linux_arm64"
      sha256 "8dbec077d97ed6b9a582ed101e405b8063889166d1a0993361f3ee7c8ca492f4"
    else
      url "https://github.com/x7ssss/vpcdrain/releases/download/v1.0.0/vpcdrain_linux_amd64"
      sha256 "d31b39ad69b25c6383024efe916f4299ab43483527e63bd1d1f7fc82b0b16d6f"
    end
  end

  def install
    binary_name = Hardware::CPU.arm? ? "vpcdrain_#{OS.kernel_name.downcase}_arm64" : "vpcdrain_#{OS.kernel_name.downcase}_amd64"
    bin.install binary_name => "vpcdrain"
  end

  test do
    system "#{bin}/vpcdrain", "--help"
  end
end
