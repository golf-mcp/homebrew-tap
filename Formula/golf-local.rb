class GolfLocal < Formula
  desc "Extend Golf Gateway security to local MCP servers"
  homepage "https://github.com/golf-mcp/golf-local"
  license "Apache-2.0"
  version "0.8.0"

  on_macos do
    on_arm do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.8.0/golf-local-darwin-arm64"
      sha256 "79c3f4d6a5007c1ee5349cae52e04923ef868c4969c83b63c033214936a9a57c"
    end
    on_intel do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.8.0/golf-local-darwin-amd64"
      sha256 "5a4200835d260a508187bd8e201dc6e26438ec23f8c92483122586bedac70c6f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.8.0/golf-local-linux-arm64"
      sha256 "cd19f8a998dd0b11f1ceee2b4bd3b401c51c396cbfb83eeaf08abbdc1d9eba1c"
    end
    on_intel do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.8.0/golf-local-linux-amd64"
      sha256 "5a62dc66b84646a6543e6b58ce76d08ed4616de75ade33caab021c241a8b39e6"
    end
  end

  def install
    binary_name = "golf-local"
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "golf-local-darwin-arm64" => binary_name
      else
        bin.install "golf-local-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "golf-local-linux-arm64" => binary_name
      else
        bin.install "golf-local-linux-amd64" => binary_name
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/golf-local version")
  end
end
