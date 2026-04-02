class GolfLocal < Formula
  desc "Extend Golf Gateway security to local MCP servers"
  homepage "https://github.com/golf-mcp/golf-local"
  license "Apache-2.0"
  version "0.9.2"

  on_macos do
    on_arm do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.9.2/golf-local-darwin-arm64"
      sha256 "f1395687cbf2abc89ed55268cf2bed68c1725a5b7b5f47e74dc190b4cb66b926"
    end
    on_intel do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.9.2/golf-local-darwin-amd64"
      sha256 "dc76f66356108e94030d6ed079056ae76fccc1f72ff33af645f4fa50930baadb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.9.2/golf-local-linux-arm64"
      sha256 "663f08327714a065c6a3501efabbf57e7c7bd137ee06199defe1365e3979b306"
    end
    on_intel do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.9.2/golf-local-linux-amd64"
      sha256 "594e9e8f176a08aef876ae1ffca6290be782903dcbe18f4dc7a43c1abd156133"
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
