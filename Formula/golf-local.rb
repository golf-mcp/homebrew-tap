class GolfLocal < Formula
  desc "Extend Golf Gateway security to local MCP servers"
  homepage "https://github.com/golf-mcp/golf-local"
  license "Apache-2.0"
  version "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.6.0/golf-local-darwin-arm64"
      sha256 "2bf360e60fd5d3a2c7932522eb1e5c9a759d800e9c2bed32b8bb519ee4d84aa0"
    end
    on_intel do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.6.0/golf-local-darwin-amd64"
      sha256 "aa94bfd2c22b4e9b09dd1c2771c0eb15be52dbd9b99f570e15944d9eb44ccff9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.6.0/golf-local-linux-arm64"
      sha256 "5b50f7ea175b824048085fec4a78fd20291c8e2be6397fa9a043379b88189368"
    end
    on_intel do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.6.0/golf-local-linux-amd64"
      sha256 "e6dd2c6bfec96f46798007642f708afd4e48e2590ed9da29c8de5aaebed3e9cf"
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
