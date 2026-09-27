class GitopsUnwedge < Formula
  desc "Kubernetes mutating webhook admission drift detector and ArgoCD ignoreDifferences generator"
  homepage "https://github.com/x7ssss/gitops-unwedge"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/x7ssss/gitops-unwedge/releases/download/v1.0.0/gitops-unwedge-darwin-arm64"
      sha256 "e657979067a0427bd0c1900b83a3efd458055f5df85a68e3e9456d96a3e83f4e"
    else
      url "https://github.com/x7ssss/gitops-unwedge/releases/download/v1.0.0/gitops-unwedge-darwin-amd64"
      sha256 "3dc50799ca4822f15da46f5e214a8e92767699176750a60d1dbca34a4b4fec13"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/x7ssss/gitops-unwedge/releases/download/v1.0.0/gitops-unwedge-linux-arm64"
      sha256 "5d4fe089a663d0c41b67ca441c9946e8130e488e5045cffffad6504f43a7d6b6"
    else
      url "https://github.com/x7ssss/gitops-unwedge/releases/download/v1.0.0/gitops-unwedge-linux-amd64"
      sha256 "1b9b169f37b5c702316b301854b2c70c765f43abe69270574ea3804bfb05207b"
    end
  end

  def install
    binary_name = Hardware::CPU.arm? ? "gitops-unwedge-#{OS.kernel_name.downcase}-arm64" : "gitops-unwedge-#{OS.kernel_name.downcase}-amd64"
    bin.install binary_name => "gitops-unwedge"
  end

  test do
    system "#{bin}/gitops-unwedge", "--help"
  end
end
