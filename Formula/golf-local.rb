class GolfLocal < Formula
  desc "Extend Golf Gateway security to local MCP servers"
  homepage "https://github.com/golf-mcp/golf-local"
  license "Apache-2.0"
  version "0.7.0"

  on_macos do
    on_arm do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.7.0/golf-local-darwin-arm64"
      sha256 "192d49b82861f1b6c54f8d32690e1290b73730872fdb3267cea5ff081799db77"
    end
    on_intel do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.7.0/golf-local-darwin-amd64"
      sha256 "13311ac0113b0781865f52334ec5c7346d819458f00e07bbd2341dc57e7a2955"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.7.0/golf-local-linux-arm64"
      sha256 "2296e04e00542e5549050343542701028617faa77340eca69e50b5c5fb1b2ae7"
    end
    on_intel do
      url "https://github.com/golf-mcp/golf-local/releases/download/golf-local-v0.7.0/golf-local-linux-amd64"
      sha256 "0d1781c2386bdb7e76744b9e60fee2195dc0579992e7772104161e26e6f07882"
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
