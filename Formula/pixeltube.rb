class Pixeltube < Formula
  desc "Terminal-based YouTube browser and pixel art video player"
  homepage "https://github.com/mawmawmaw/pixeltube"
  url "https://github.com/mawmawmaw/pixeltube/archive/refs/tags/v0.0.6.tar.gz"
  sha256 "7a31844dbc7efc2ff65088de58635f0741a130987efb63a6bcb3a5c17360c0ed"
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
