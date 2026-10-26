class Pixeltube < Formula
  desc "Terminal-based YouTube browser and pixel art video player"
  homepage "https://github.com/mawmawmaw/pixeltube"
  url "https://github.com/mawmawmaw/pixeltube/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "5be9777f17fa7769013679b5a6d063125fe042d5902cf9bbaa48710fcab37fec"
  license "MIT"

  depends_on "node"
  depends_on "ffmpeg"
  depends_on "yt-dlp"

  def install
    ENV["HOMEBREW_NO_ENV_HINTS"] = "1"
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
