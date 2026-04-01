class Pixeltube < Formula
  desc "Terminal-based YouTube browser and pixel art video player"
  homepage "https://github.com/mawmawmaw/pixeltube"
  url "https://github.com/mawmawmaw/pixeltube/archive/refs/tags/v0.0.7.tar.gz"
  sha256 "610d607043b294d36c8ae4937964a07797ab228746ead971350d9270a26bf751"
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
