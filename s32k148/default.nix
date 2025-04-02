{
  pkgs ? import <nixpkgs> { },
  callPackage ? pkgs.callPackage,
  stdenv ? pkgs.stdenv,
  cmake ? pkgs.cmake,
  gcc-arm-embedded ? pkgs.gcc-arm-embedded,
  ninja ? pkgs.ninja,
}:

let
  sdk = callPackage ../nix/s32sdk.nix { inherit pkgs; };
in

stdenv.mkDerivation {
  pname = "dc33-fw-s32k148";
  version = "0.1.0";
  src = ./.;

  nativeBuildInputs = [
    cmake
    gcc-arm-embedded
    ninja
  ];

  buildInputs = [ sdk ];

  preConfigure = ''
    export NXP_SDK=${sdk}
    export CC=${gcc-arm-embedded}/bin/arm-none-eabi-gcc
    export CXX=${gcc-arm-embedded}/bin/arm-none-eabi-g++
  '';
}
