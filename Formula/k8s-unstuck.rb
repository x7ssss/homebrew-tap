class K8sUnstuck < Formula
  desc "Safely diagnose, fence GitOps reconcilers, and unstick deadlocked Kubernetes namespaces"
  homepage "https://github.com/x7ssss/k8s-unstuck"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/x7ssss/k8s-unstuck/releases/download/v1.0.0/k8s-unstuck_darwin_arm64"
      sha256 "8efcc53d5728b7592a112ec4f8d311918b57eb7e896274ad08b7e93d4fcb2c5d"
    else
      url "https://github.com/x7ssss/k8s-unstuck/releases/download/v1.0.0/k8s-unstuck_darwin_amd64"
      sha256 "d79b6abc925b7fb0b9b52d7e3faae920c55e134773c00e675f92c08de8244577"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/x7ssss/k8s-unstuck/releases/download/v1.0.0/k8s-unstuck_linux_arm64"
      sha256 "f85389bc6551408b6a8035aef67284d226a697c5bc0657a7acb2871b186aaf7f"
    else
      url "https://github.com/x7ssss/k8s-unstuck/releases/download/v1.0.0/k8s-unstuck_linux_amd64"
      sha256 "67e4e07873f2e69511ac2f8a32bde7f97da6f95457ff446c3bde760296932c55"
    end
  end

  def install
    binary_name = Hardware::CPU.arm? ? "k8s-unstuck_#{OS.kernel_name.downcase}_arm64" : "k8s-unstuck_#{OS.kernel_name.downcase}_amd64"
    bin.install binary_name => "k8s-unstuck"
  end

  test do
    system "#{bin}/k8s-unstuck", "--help"
  end
end
