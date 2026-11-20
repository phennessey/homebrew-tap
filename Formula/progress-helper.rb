class ProgressHelper < Formula
  desc "Native macOS progress bar for Finder Quick Actions and more"
  homepage "https://github.com/phennessey/progress-helper"
  url "https://github.com/phennessey/progress-helper/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "ced9f68e58cdaebf23cd18e248d4846a90153c69ecea82919f86c21b506b9cb5"
  license "MIT"

  depends_on :macos

  on_macos do
    depends_on macos: :monterey
  end

  def install
    system "make", "build/progress-helper", "build/ProgressHelperLib.scptd"
    bin.install "build/progress-helper"
    pkgshare.install "build/ProgressHelperLib.scptd"
  end

  def caveats
    <<~EOS
      To use Progress Helper from AppleScript, install its library once:
        progress-helper setup-applescript
    EOS
  end

  test do
    assert_match "usage", shell_output("#{bin}/progress-helper --help 2>&1", 64)
  end
end
