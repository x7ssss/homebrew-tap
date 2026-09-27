class CrdSweeper < Formula
  desc "Kubernetes discovery poisoning and orphaned CRD schema reconciler"
  homepage "https://github.com/x7ssss/crd-sweeper"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/x7ssss/crd-sweeper/releases/download/v1.0.0/crd-sweeper_darwin_arm64"
      sha256 "d5ee18db0186c88811ec27095757585eb4f084ef4a5c0958f3b7bc74311b527b"
    else
      url "https://github.com/x7ssss/crd-sweeper/releases/download/v1.0.0/crd-sweeper_darwin_amd64"
      sha256 "944791bb553392539638cddc68d1e05076c1d743c8be0e23947fa6e5df39cf94"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/x7ssss/crd-sweeper/releases/download/v1.0.0/crd-sweeper_linux_arm64"
      sha256 "7fa6fd89a19712f25204364087b3cf2945dede1223e7443f95a21dda76a27209"
    else
      url "https://github.com/x7ssss/crd-sweeper/releases/download/v1.0.0/crd-sweeper_linux_amd64"
      sha256 "a43c666742f7f514cf14cbb744b9be6379a5c67ee6f6be1c5679f7c8604cf857"
    end
  end

  def install
    binary_name = Hardware::CPU.arm? ? "crd-sweeper_#{OS.kernel_name.downcase}_arm64" : "crd-sweeper_#{OS.kernel_name.downcase}_amd64"
    bin.install binary_name => "crd-sweeper"
  end

  test do
    system "#{bin}/crd-sweeper", "--help"
  end
end
