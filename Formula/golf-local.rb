class GolfLocal < Formula
  desc "Extend Golf Gateway security to local MCP servers"
  homepage "https://github.com/golf-mcp/golf-local"
  license "Apache-2.0"
  version "0.9.0"

  on_macos do
    on_arm do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.9.0/golf-local-darwin-arm64"
      sha256 "55afa34ca38fec6ded0fe11551aa2115db9ffee2acd53bb265385efaec0f1032"
    end
    on_intel do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.9.0/golf-local-darwin-amd64"
      sha256 "218e937a85af9f4814aa610633c49423d77e936fbe94767a25c9b042533c0017"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.9.0/golf-local-linux-arm64"
      sha256 "3a8b08c022e6ba4c498a8c04542bc9e3e273f6960659982723d5fd313bd3f83a"
    end
    on_intel do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.9.0/golf-local-linux-amd64"
      sha256 "681c148a858a50244a649910eee72b6297eaa5757a1d4e3d46a0484f28e326a5"
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
