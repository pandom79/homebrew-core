class Ulib < Formula
  desc "C library"
  homepage "https://github.com/pandom79/Ulib"
  url "https://github.com/pandom79/Ulib/archive/refs/tags/4.1.9.tar.gz"
  sha256 "b852ed55a4abdeef76ab59b3229b18fd755f46396424913155eb4a23ce68ce8c"
  license "GPL-3.0-or-later"

  depends_on "doxygen" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build

  def install
    system "meson", "setup", "build", "-DNO_TEST=false", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "test", "-C", "build"
    system "meson", "install", "-C", "build"
  end

  test do
    system "false"
  end
end
