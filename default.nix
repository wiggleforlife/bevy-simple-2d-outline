{ pkgs ? import <nixpkgs> { } }:

with pkgs;
let
  fenix = import (fetchTarball
    "https://github.com/nix-community/fenix/archive/monthly.tar.gz") { };
in mkShell rec {
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [
    fenix.latest.toolchain
    udev
    alsa-lib
    vulkan-loader
    clang
    lld
    xorg.libX11
    xorg.libXcursor
    xorg.libXi
    xorg.libXrandr
    libxkbcommon
    wayland
  ];
  LD_LIBRARY_PATH = lib.makeLibraryPath buildInputs;
}
