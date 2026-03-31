class Pixeltube < Formula
  desc "Terminal-based YouTube browser and pixel art video player"
  homepage "https://github.com/mawmawmaw/pixeltube"
  url "https://github.com/mawmawmaw/pixeltube/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "71e6fc5d86200326a0037e14e6e9dfac3ec6cd318d8e443cfd20da4f73b8c204"
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
