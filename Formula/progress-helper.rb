class ProgressHelper < Formula
  desc "Native macOS progress bar for Finder Quick Actions and more"
  homepage "https://github.com/phennessey/progress-helper"
  url "https://github.com/phennessey/progress-helper/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "84f397824c8896cf5e5a7fa563c4ddccf0a26700f5e9585fcb9e8bcf46f94a20"
  license "MIT"

  depends_on :macos
  depends_on macos: :monterey

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
