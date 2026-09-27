class HelmUnwedge < Formula
  desc "High-performance zero-SDK Helm v3 release deadlock breaker with distributed lease locking"
  homepage "https://github.com/x7ssss/helm-unwedge"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/x7ssss/helm-unwedge/releases/download/v1.0.0/helm-unwedge_darwin_arm64"
      sha256 "adaf5ac021307d0f8eaafe18161ede6e43c144ad837afbc55d28f226ad48fd00"
    else
      url "https://github.com/x7ssss/helm-unwedge/releases/download/v1.0.0/helm-unwedge_darwin_amd64"
      sha256 "e04792da7f1a37399f7b1a934d63e0cf89ed0d3d3a9746914dcb50c40ea97e0c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/x7ssss/helm-unwedge/releases/download/v1.0.0/helm-unwedge_linux_arm64"
      sha256 "7d3527bd0b4d91cca0a1b500d33e5db5d1a21038dc0dd878269791411e20697b"
    else
      url "https://github.com/x7ssss/helm-unwedge/releases/download/v1.0.0/helm-unwedge_linux_amd64"
      sha256 "c71ad57ae774e996b6a742b1e831f8e7508920c27b7f6185d411f5a0f725a917"
    end
  end

  def install
    binary_name = Hardware::CPU.arm? ? "helm-unwedge_#{OS.kernel_name.downcase}_arm64" : "helm-unwedge_#{OS.kernel_name.downcase}_amd64"
    bin.install binary_name => "helm-unwedge"
  end

  test do
    system "#{bin}/helm-unwedge", "--help"
  end
end
