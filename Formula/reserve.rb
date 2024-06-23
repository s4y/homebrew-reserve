class Reserve < Formula
  desc "Live reloading web server with extra goodies"
  homepage "https://github.com/s4y/reserve"
  url "https://github.com/s4y/reserve/archive/refs/tags/v1.0.10.tar.gz"
  sha256 "40c1f0202876db3c2f784ef8f867a2a66f95517df1a58f5275b63d7232679757"
  license "Apache-2.0"
  head "https://github.com/s4y/reserve.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "./reserve/reserve", "./reserve"
    bin.install "reserve/reserve" => "reserve"
  end

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "812a2ce2556412202df67ed1e8e3df2502e93ed3986b182295a8c758d6c4c0bc"
    sha256 cellar: :any_skip_relocation, sonoma:       "812a2ce2556412202df67ed1e8e3df2502e93ed3986b182295a8c758d6c4c0bc"
  end

  test do
    output = shell_output(bin/"reserve --help 2>&1")
    assert_match(/^Usage of/, output)
  end
end
