class Pixeltube < Formula
  desc "Terminal-based YouTube browser and pixel art video player"
  homepage "https://github.com/mawmawmaw/pixeltube"
  url "https://github.com/mawmawmaw/pixeltube/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "728a10a82992ae07d888d48d50ca0c0e188e074f81e0e360af7b4c74b9d879fc"
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
