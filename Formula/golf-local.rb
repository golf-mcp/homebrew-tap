class GolfLocal < Formula
  desc "Extend Golf Gateway security to local MCP servers"
  homepage "https://github.com/golf-mcp/golf-local"
  license "Apache-2.0"
  version "0.9.1"

  on_macos do
    on_arm do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.9.1/golf-local-darwin-arm64"
      sha256 "d1b474bb9cd4a38f967461b89543d35d093876e5407e4a092109f1dfc454a0a7"
    end
    on_intel do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.9.1/golf-local-darwin-amd64"
      sha256 "3b83f19cbf17d0acd2efafad57b50e33a3fcff09ea091a17d6f253f449e8f484"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.9.1/golf-local-linux-arm64"
      sha256 "e724a39980317b47c7c5f38cb515ee434acd1a240bc9b79fc972f421024fc544"
    end
    on_intel do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.9.1/golf-local-linux-amd64"
      sha256 "cfaf8ce4a7d5276d44945b64885eb8d045cb4ee3686e9a3f840d6071678e048a"
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
