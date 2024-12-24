class Reserve < Formula
  desc "Live reloading web server with extra goodies"
  homepage "https://github.com/s4y/reserve"
  url "https://github.com/s4y/reserve/archive/refs/tags/v1.1.tar.gz"
  sha256 "7f5a11f9030f05f85b730a89ef795935ec48f647561fdbc1f7659d91646b4e31"
  license "Apache-2.0"
  head "https://github.com/s4y/reserve.git", branch: "main"

  bottle do
    root_url "https://github.com/s4y/homebrew-reserve/releases/download/reserve-1.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "adfb238a9f1ff67cb3a7ab3c5aed36efdf77d63e95344f7604032db02c95bf50"
    sha256 cellar: :any_skip_relocation, ventura:      "2b9cd79d3234dac378f3d1322defa0cab1e7fd6e628ea0a4a5b5fe219297e1ec"
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
