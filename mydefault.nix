{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "pbrt-v3-git";
  src = ./.;

  buildInputs = with pkgs; [
    cmake
    zlib
  ];

}

