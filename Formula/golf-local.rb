class GolfLocal < Formula
  desc "MCP security proxy - protect AI tool connections locally"
  homepage "https://github.com/golf-mcp/golf-local"
  license "Apache-2.0"
  version "0.4"

  on_macos do
    on_arm do
      url "https://github.com/golf-mcp/golf-local/releases/download/v0.4/golf-local-darwin-arm64"
      sha256 "dcf8489f8687a54a35d7abe0cb509000ee3cae2a86cc39557c558d47017f4db8"
    end
    on_intel do
      url "https://github.com/golf-mcp/golf-local/releases/download/v0.4/golf-local-darwin-amd64"
      sha256 "56c6152f90f9f5865d49402a589d2a3eb23c8ebecb828e0740071c500e180f6d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/golf-mcp/golf-local/releases/download/v0.4/golf-local-linux-arm64"
      sha256 "3fd2197463708a159f39bcff8fb8a4d867ac39baecff2f5bc63b6fee07a1e4b1"
    end
    on_intel do
      url "https://github.com/golf-mcp/golf-local/releases/download/v0.4/golf-local-linux-amd64"
      sha256 "8924ed4997a807372f83b5eb8f7b78293ce3bfc55d0aa1dc718602d7dd4c3196"
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
