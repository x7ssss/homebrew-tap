class K8sDnsMedic < Formula
  desc "Linux kernel Netfilter conntrack race prober and Kubernetes DNS latency diagnostic"
  homepage "https://github.com/x7ssss/k8s-dns-medic"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/x7ssss/k8s-dns-medic/releases/download/v1.0.0/k8s-dns-medic-darwin-arm64"
      sha256 "dbf8ebc67c02cf13a6657b964b4e3f2a466e6317a6bafd8331d0a530aed5195c"
    else
      url "https://github.com/x7ssss/k8s-dns-medic/releases/download/v1.0.0/k8s-dns-medic-darwin-amd64"
      sha256 "8eb03ac2114a0e9f92e11d9c91dd764ae8cc49d3c0bd21ba4142cc9140ad2330"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/x7ssss/k8s-dns-medic/releases/download/v1.0.0/k8s-dns-medic-linux-arm64"
      sha256 "47b670b2349774f04f21e2df0332ee5dbe3e36ebabbb80a22a243f39f84ce5c4"
    else
      url "https://github.com/x7ssss/k8s-dns-medic/releases/download/v1.0.0/k8s-dns-medic-linux-amd64"
      sha256 "d9cec9fdc69c5ec02c092ee65eb2276ca141155a55b672f5c53f0d7f3f42ba74"
    end
  end

  def install
    binary_name = Hardware::CPU.arm? ? "k8s-dns-medic-#{OS.kernel_name.downcase}-arm64" : "k8s-dns-medic-#{OS.kernel_name.downcase}-amd64"
    bin.install binary_name => "k8s-dns-medic"
  end

  test do
    system "#{bin}/k8s-dns-medic", "--help"
  end
end
