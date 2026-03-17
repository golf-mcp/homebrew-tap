class GolfLocal < Formula
  desc "Extend Golf Gateway security to local MCP servers"
  homepage "https://github.com/golf-mcp/golf-local"
  license "Apache-2.0"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.5.0/golf-local-darwin-arm64"
      sha256 "475fc46f4535799ac63d2095a79ad7dc83feb425366cb658995f7b74f494d2ad"
    end
    on_intel do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.5.0/golf-local-darwin-amd64"
      sha256 "56f32a38f944ef83f378b6e2c378a157ff9a7aff4b4bb111c810bfa34dbdb3af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.5.0/golf-local-linux-arm64"
      sha256 "b874c7497eb4c3613195b933aa77df20523d1136a847d3594ca33c042b0797ea"
    end
    on_intel do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.5.0/golf-local-linux-amd64"
      sha256 "46ef5e4f97c659b73fe849c249faf841240d69ccf9635d6b0069185e287de9fc"
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
