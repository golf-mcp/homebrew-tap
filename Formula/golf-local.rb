# frozen_string_literal: true

# Placeholder — version, URLs, and SHA256s are dummy values.
# The first release will overwrite this file via the "Update Homebrew formula" CI step.

class GolfLocal < Formula
  desc "MCP security proxy - protect AI tool connections locally"
  homepage "https://github.com/golf-mcp/golf-local"
  version "0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/golf-mcp/golf-local/releases/download/v0.1/golf-local-darwin-arm64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/golf-mcp/golf-local/releases/download/v0.1/golf-local-darwin-amd64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/golf-mcp/golf-local/releases/download/v0.1/golf-local-linux-arm64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/golf-mcp/golf-local/releases/download/v0.1/golf-local-linux-amd64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
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
