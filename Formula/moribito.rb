class Moribito < Formula
  desc "LDAP CLI Explorer - Interactive terminal-based LDAP client with TUI"
  homepage "https://github.com/ericschmar/moribito"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/ericschmar/moribito/releases/download/v#{version}/moribito-darwin-amd64"
      sha256 "40d6b546fcee0040f1859384259c2b10cf26c9e49725a06148c050ae88291814"
    end
    if Hardware::CPU.arm?
      url "https://github.com/ericschmar/moribito/releases/download/v#{version}/moribito-darwin-arm64"  
      sha256 "44aa11ae1493b8ef490bea01c99a4f18ba9930c340b2d571a97cc398446bce20"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ericschmar/moribito/releases/download/v#{version}/moribito-linux-amd64"
      sha256 "e3e56791b12af0c959aaa647bbb6aaa03e9b7bda3a23a328d4dfe5fb652b81ba"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ericschmar/moribito/releases/download/v#{version}/moribito-linux-arm64"
      sha256 "7b617a6e5e8bc446bd2869da21d87fe85990d5f147cb17d84136bc45f608f2a1"
    end
  end

  def install
    bin.install "moribito-#{OS.kernel_name.downcase}-#{Hardware::CPU.arch}" => "moribito"
  end

  test do
    # Test version output
    output = shell_output("#{bin}/moribito --version")
    assert_match "moribito version #{version}", output
    
    # Test help output  
    output = shell_output("#{bin}/moribito --help")
    assert_match "LDAP CLI Explorer", output
  end
end