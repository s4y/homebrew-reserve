class Reserve < Formula
  desc "Live reloading web server with extra goodies"
  homepage "https://github.com/s4y/reserve"
  url "https://github.com/s4y/reserve/archive/refs/tags/v1.0.12.tar.gz"
  sha256 "ba6eee1aaebb0a4f30f2e83025af6c82055c0240ef723b4698d95d574d84da37"
  license "Apache-2.0"
  head "https://github.com/s4y/reserve.git", branch: "main"

  bottle do
    root_url "https://github.com/s4y/homebrew-reserve/releases/download/reserve-1.0.12"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "42a402053895880571645a61de6ccd3e700cc82e93daf3e8bd233701efc67b60"
    sha256 cellar: :any_skip_relocation, ventura:      "1cfa4554d6f3d49c88f5cb5a20c9ee9e437ce0ed4f30ff638e07d3924c2192ef"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a0c584db11716245030009f91f19c99d1f612cdb75ab4742ece3ca089ba48c7f"
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
