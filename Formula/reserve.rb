class Reserve < Formula
  desc "Live reloading web server with extra goodies"
  homepage "https://github.com/s4y/reserve"
  url "https://github.com/s4y/reserve/archive/refs/tags/v1.0.11.tar.gz"
  sha256 "b3ba6d029a32e01e6cbde79180829d27e0c46c386c10468420f24421adbd1df9"
  license "Apache-2.0"
  head "https://github.com/s4y/reserve.git", branch: "main"

  bottle do
    root_url "https://github.com/s4y/homebrew-reserve/releases/download/reserve-1.0.11"
    sha256 cellar: :any_skip_relocation, ventura:      "7a44f21232af50a329f4d1c7a2f9f6832560fff61cb1a97445bf31284f75d717"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a0a3ed84c4c9967b6d14178f2c7aa4e089726eea25a39f0f0b5bc33c8095e821"
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
