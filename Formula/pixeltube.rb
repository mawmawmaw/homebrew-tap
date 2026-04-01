class Pixeltube < Formula
  desc "Terminal-based YouTube browser and pixel art video player"
  homepage "https://github.com/mawmawmaw/pixeltube"
  url "https://github.com/mawmawmaw/pixeltube/archive/refs/tags/v0.0.8.tar.gz"
  sha256 "c406fc92c207056ebd9462c5c5567ef26e2eb9e22a127b3dc3b176595cf551f8"
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
