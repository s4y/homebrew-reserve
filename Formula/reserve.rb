class Reserve < Formula
  desc "Live reloading web server with extra goodies"
  homepage "https://github.com/s4y/reserve"
  url "https://github.com/s4y/reserve/archive/refs/tags/v1.0.10.tar.gz"
  sha256 "40c1f0202876db3c2f784ef8f867a2a66f95517df1a58f5275b63d7232679757"
  license "Apache-2.0"
  head "https://github.com/s4y/reserve.git", branch: "main"

  bottle do
    root_url "https://github.com/s4y/homebrew-reserve/releases/download/reserve-1.0.10"
    rebuild 1
    sha256 cellar: :any_skip_relocation, ventura:      "6639d8a1c2efb9b78452bada714e01a301ad3f8a3cc11f21406534425d7edfc7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c8f7c0ab1c51f5bcf9b0502a27e150ac5c52a776e3ff4e0c9a9841b8dfea8994"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "./reserve/reserve", "./reserve"
    bin.install "reserve/reserve" => "reserve"
  end

  test do
    output = shell_output(bin/"reserve --help 2>&1")
    assert_match(/^Usage of/, output)
  end
end
