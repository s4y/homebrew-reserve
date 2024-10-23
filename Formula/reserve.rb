class Reserve < Formula
  desc "Live reloading web server with extra goodies"
  homepage "https://github.com/s4y/reserve"
  url "https://github.com/s4y/reserve/archive/refs/tags/v1.0.11.tar.gz"
  sha256 "b3ba6d029a32e01e6cbde79180829d27e0c46c386c10468420f24421adbd1df9"
  license "Apache-2.0"
  head "https://github.com/s4y/reserve.git", branch: "main"

  bottle do
    root_url "https://github.com/s4y/homebrew-reserve/releases/download/reserve-1.0.11"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "a4e8eecbf946826115badb79a29fd0bf2e187f0accff9506349d6e53e4841f42"
    sha256 cellar: :any_skip_relocation, ventura:      "42dc7ce98aa1de56ff039e9fae21a062c514aca68020a9430b03c4ac0cc94c34"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9564ae62adba3c0018a494dfce00119a5fdf75ff4f02bf7d41e586f91f6315f9"
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
