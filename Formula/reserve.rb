class Reserve < Formula
  desc "Live reloading web server with extra goodies"
  homepage "https://github.com/s4y/reserve"
  url "https://github.com/s4y/reserve/archive/refs/tags/v1.0.11.tar.gz"
  sha256 "40c1f0202876db3c2f784ef8f867a2a66f95517df1a58f5275b63d7232679757"
  license "Apache-2.0"
  head "https://github.com/s4y/reserve.git", branch: "main"

  bottle do
    root_url "https://github.com/s4y/homebrew-reserve/releases/download/reserve-1.0.11"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "a81b86f1e2b6db0ab79a4d2c4622baa060c4a4b0d3f5a32a2c6a5255e71133d3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "a81b86f1e2b6db0ab79a4d2c4622baa060c4a4b0d3f5a32a2c6a5255e71133d3"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "a81b86f1e2b6db0ab79a4d2c4622baa060c4a4b0d3f5a32a2c6a5255e71133d3"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "a81b86f1e2b6db0ab79a4d2c4622baa060c4a4b0d3f5a32a2c6a5255e71133d3"
    sha256 cellar: :any_skip_relocation, sonoma:         "06ca762d9337ab096b4a24f0463d7562d9e6da0f74bb3c3b73200e0444d47589"
    sha256 cellar: :any_skip_relocation, ventura:        "06ca762d9337ab096b4a24f0463d7562d9e6da0f74bb3c3b73200e0444d47589"
    sha256 cellar: :any_skip_relocation, monterey:       "06ca762d9337ab096b4a24f0463d7562d9e6da0f74bb3c3b73200e0444d47589"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "c8f7c0ab1c51f5bcf9b0502a27e150ac5c52a776e3ff4e0c9a9841b8dfea8994"
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
