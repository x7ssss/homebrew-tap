class KafkaUnwedge < Formula
  desc "Kafka consumer group rebalance storm breaker and wire protocol zombie fencer"
  homepage "https://github.com/x7ssss/kafka-unwedge"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/x7ssss/kafka-unwedge/releases/download/v1.0.0/kafka-unwedge-darwin-arm64"
      sha256 ""
    else
      url "https://github.com/x7ssss/kafka-unwedge/releases/download/v1.0.0/kafka-unwedge-darwin-amd64"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/x7ssss/kafka-unwedge/releases/download/v1.0.0/kafka-unwedge-linux-arm64"
      sha256 ""
    else
      url "https://github.com/x7ssss/kafka-unwedge/releases/download/v1.0.0/kafka-unwedge-linux-amd64"
      sha256 ""
    end
  end

  def install
    binary_name = Hardware::CPU.arm? ? "kafka-unwedge-#{OS.kernel_name.downcase}-arm64" : "kafka-unwedge-#{OS.kernel_name.downcase}-amd64"
    bin.install binary_name => "kafka-unwedge"
  end

  test do
    system "#{bin}/kafka-unwedge", "--help"
  end
end
