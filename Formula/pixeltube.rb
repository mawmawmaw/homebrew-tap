class Pixeltube < Formula
  desc "Terminal-based YouTube browser and pixel art video player"
  homepage "https://github.com/mawmawmaw/pixeltube"
  url "https://github.com/mawmawmaw/pixeltube/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "a1e932509c1b779f955c50c9cc610cfa3f4075e75b7ce585957059c9858c0487"
  license "MIT"

  depends_on "node"
  depends_on "ffmpeg"
  depends_on "yt-dlp"

  def install
    system "npm", "install", "--omit=dev", "--ignore-scripts"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/pixeltube.js" => "pixeltube"
  end

  test do
    assert_match "pixeltube", shell_output("#{bin}/pixeltube help")
  end
end
