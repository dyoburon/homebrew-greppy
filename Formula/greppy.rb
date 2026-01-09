class Greppy < Formula
  include Language::Python::Virtualenv

  desc "Semantic code search CLI using ChromaDB + Ollama"
  homepage "https://github.com/dyoburon/greppy"
  url "https://github.com/dyoburon/greppy/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "160ffc0fba99c8c98406fdfcad8c584ec8eb710ee69e222d9abf0f92f4791726"
  license "MIT"

  depends_on "python@3.11"

  def install
    python3 = Formula["python@3.11"].opt_bin/"python3.11"
    system python3, "-m", "venv", libexec
    system libexec/"bin/pip", "install", "--upgrade", "pip"
    system libexec/"bin/pip", "install", buildpath
    bin.install_symlink libexec/"bin/greppy"
  end

  test do
    system bin/"greppy", "--help"
  end
end
