# frozen_string_literal: true

# Placeholder — version, URLs, and SHA256s are dummy values.
# The first release will overwrite this file via goreleaser's brews config.

class GolfScanner < Formula
  desc "Security scanner for MCP servers - discover and audit across IDEs"
  homepage "https://github.com/golf-mcp/golf-scanner"
  version "0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/golf-mcp/golf-scanner/releases/download/v0.0/golf-scanner_0.0_darwin_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/golf-mcp/golf-scanner/releases/download/v0.0/golf-scanner_0.0_darwin_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/golf-mcp/golf-scanner/releases/download/v0.0/golf-scanner_0.0_linux_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/golf-mcp/golf-scanner/releases/download/v0.0/golf-scanner_0.0_linux_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "golf-scanner"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/golf-scanner version")
  end
end
