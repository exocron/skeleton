{
  pkgs ? import <nixpkgs> { },
  callPackage ? pkgs.callPackage,
  runCommand ? pkgs.runCommand,
}:

let
  rp2040 = callPackage ./rp2040/default.nix { };
  s32k148 = callPackage ./s32k148/default.nix { };
in

runCommand "dc33-fw-0.1.0" { } ''
  mkdir -p $out/bin
  cp -r ${rp2040}/bin/. ${s32k148}/bin/. $out/bin
''
