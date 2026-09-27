class X7 < Formula
  desc "Zero-dependency multi-system infrastructure triage and deadlock remediation engine"
  homepage "https://github.com/x7ssss/x7"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/x7ssss/x7/releases/download/v1.0.0/x7-darwin-arm64"
      sha256 "413c5fadbdc68fdff881547ebf6e5c3c907b30b2239b02797e15fe5a8e02258a"
    else
      url "https://github.com/x7ssss/x7/releases/download/v1.0.0/x7-darwin-amd64"
      sha256 "d9a1e027c96194c1467a77f6a2523613f506e60fddd384f33c31fc3f1d0382cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/x7ssss/x7/releases/download/v1.0.0/x7-linux-arm64"
      sha256 "a9243a0105c747a1779f9cbf3a1be7532bab60fa1143bf89e96ce5202c0cadeb"
    else
      url "https://github.com/x7ssss/x7/releases/download/v1.0.0/x7-linux-amd64"
      sha256 "3eb8c15bc87c4f1ca0f641b4d0a37d7987b9899f33dbdd81cb1ca720331a47f7"
    end
  end

  def install
    binary_name = Hardware::CPU.arm? ? "x7-#{OS.kernel_name.downcase}-arm64" : "x7-#{OS.kernel_name.downcase}-amd64"
    bin.install binary_name => "x7"
  end

  test do
    system "#{bin}/x7", "version"
  end
end
