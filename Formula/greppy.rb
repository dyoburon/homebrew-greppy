class Greppy < Formula
  include Language::Python::Virtualenv

  desc "Semantic code search CLI using ChromaDB + sentence-transformers"
  homepage "https://github.com/dyoburon/greppy"
  url "https://github.com/dyoburon/greppy/archive/refs/tags/v0.5.5.tar.gz"
  sha256 "7b19d93ba2913ccb12178d1d668a3b33bdabf7f0beea6028119027209bd4a90d"
  license "MIT"

  depends_on "python@3.12"

  def install
    python3 = Formula["python@3.12"].opt_bin/"python3.12"
    system python3, "-m", "venv", libexec
    system libexec/"bin/pip", "install", "--upgrade", "pip"
    system libexec/"bin/pip", "install", buildpath
    bin.install_symlink libexec/"bin/greppy"
  end

  test do
    system bin/"greppy", "--help"
  end
end
