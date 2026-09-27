class K8sUnstuck < Formula
  desc "Safely diagnose, fence GitOps reconcilers, and unstick deadlocked Kubernetes namespaces"
  homepage "https://github.com/x7ssss/k8s-unstuck"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/x7ssss/k8s-unstuck/releases/download/v1.0.0/k8s-unstuck_darwin_arm64"
      sha256 ""
    end
    on_intel do
      url "https://github.com/x7ssss/k8s-unstuck/releases/download/v1.0.0/k8s-unstuck_darwin_amd64"
      sha256 ""
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/x7ssss/k8s-unstuck/releases/download/v1.0.0/k8s-unstuck_linux_arm64"
      sha256 ""
    end
    on_intel do
      url "https://github.com/x7ssss/k8s-unstuck/releases/download/v1.0.0/k8s-unstuck_linux_amd64"
      sha256 ""
    end
  end

  def install
    bin.install Dir["k8s-unstuck_*"].first => "k8s-unstuck"
  end

  test do
    system "#{bin}/k8s-unstuck", "--help"
  end
end
