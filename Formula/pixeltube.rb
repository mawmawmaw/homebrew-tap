class Pixeltube < Formula
  desc "Terminal-based YouTube browser and pixel art video player"
  homepage "https://github.com/mawmawmaw/pixeltube"
  url "https://github.com/mawmawmaw/pixeltube/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "6a92f07fe8795d5783bf0e3a3c135c43f73cdea68b71c6b763d08c05220cb0bb"
  license "MIT"

  depends_on "node"
  depends_on "ffmpeg"
  depends_on "yt-dlp"

  def install
    system "npm", "install"
    system "npm", "run", "build"
    system "npm", "prune", "--omit=dev"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"dist/bin/pixeltube.js" => "pixeltube"
  end

  test do
    assert_match "pixeltube", shell_output("#{bin}/pixeltube help")
  end
end
