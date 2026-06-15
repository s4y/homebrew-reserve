class Reserve < Formula
  desc "Live reloading web server with extra goodies"
  homepage "https://github.com/s4y/reserve"
  url "https://github.com/s4y/reserve/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "6556f0e4fbc32e1f8375242552fca7b1e6ec039a2417babf9b94e870b21a67b4"
  license "Apache-2.0"
  head "https://github.com/s4y/reserve.git", branch: "main"

  bottle do
    root_url "https://github.com/s4y/homebrew-reserve/releases/download/reserve-1.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "67a46e11c0e3b0bf9606af43ced0808868348e96c82ab17b50e793f009533476"
    sha256 cellar: :any_skip_relocation, ventura:      "8dc576a5fe0008fe0281f467c7ee35aad7cf379fa56a1fff3fc940ad00de2906"
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
