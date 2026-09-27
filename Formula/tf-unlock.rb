class TfUnlock < Formula
  desc "Zero-SDK multi-backend Terraform and OpenTofu state lock breaker"
  homepage "https://github.com/x7ssss/tf-unlock"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/x7ssss/tf-unlock/releases/download/v1.0.0/tf-unlock_darwin_arm64"
      sha256 "e2fc3bd23c53b0580b5248a44acfb963d322fd5720ede1f61bbba1aa8808c277"
    else
      url "https://github.com/x7ssss/tf-unlock/releases/download/v1.0.0/tf-unlock_darwin_amd64"
      sha256 "6a806bc0eb7854fb5b196d57867cf37ad4603498f3defc9bf7d3f1a994592d25"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/x7ssss/tf-unlock/releases/download/v1.0.0/tf-unlock_linux_arm64"
      sha256 "16af63b43fafb473dcee4f411ce5dbaea347586bc5667b1525ca615c1f61695b"
    else
      url "https://github.com/x7ssss/tf-unlock/releases/download/v1.0.0/tf-unlock_linux_amd64"
      sha256 "f6d5727ae1ff85fb51fcab5f513f3cce6b5129965973ca28b2d193494e9b09cc"
    end
  end

  def install
    binary_name = Hardware::CPU.arm? ? "tf-unlock_#{OS.kernel_name.downcase}_arm64" : "tf-unlock_#{OS.kernel_name.downcase}_amd64"
    bin.install binary_name => "tf-unlock"
  end

  test do
    system "#{bin}/tf-unlock", "--help"
  end
end
