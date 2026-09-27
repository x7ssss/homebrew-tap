class PgWalDrain < Formula
  desc "PostgreSQL WAL disk exhaustion circuit breaker and offline disaster recovery tool"
  homepage "https://github.com/x7ssss/pg-wal-drain"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/x7ssss/pg-wal-drain/releases/download/v1.0.0/pg-wal-drain-darwin-arm64"
      sha256 "6f5938c7d6171a0fa20c598165918af6368c16300ffe6db5fb9d9bf2ea820190"
    else
      url "https://github.com/x7ssss/pg-wal-drain/releases/download/v1.0.0/pg-wal-drain-darwin-amd64"
      sha256 "85805b9947d7762238f9fcbbc2be46bec81e8d15c3a6d11ba6c193436f241e7b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/x7ssss/pg-wal-drain/releases/download/v1.0.0/pg-wal-drain-linux-arm64"
      sha256 "dfc8e30c2a76e72d6231b9a43e1695d29dc6d6dc50407e21955100d05f07ce1a"
    else
      url "https://github.com/x7ssss/pg-wal-drain/releases/download/v1.0.0/pg-wal-drain-linux-amd64"
      sha256 "ece7f875e8d60b4b41d56b63885db9b8600f378cc65dc7e8f459f18c75ff542c"
    end
  end

  def install
    bin_file = Dir["pg-wal-drain*"].first
    bin.install bin_file => "pg-wal-drain"
  end

  test do
    system "#{bin}/pg-wal-drain", "--help"
  end
end
