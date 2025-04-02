{
  pkgs ? import <nixpkgs> { },
  lib ? pkgs.lib,
  runCommand ? pkgs.runCommand,
  wineWowPackages ? pkgs.wineWowPackages,
}:

let
  exe = builtins.path {
    path = ../S32SDK_S32K1xx_RTM_4.0.2.exe;
    recursive = false;
    sha256 = "cb4655eb821830e0aa78fe6ad500d983078f7b2c81a20304a2f8eb5eb9639d45";
  };
in

runCommand "s32sdk-4.0.2"
  {
    nativeBuildInputs = [ wineWowPackages.unstableFull ];

    meta = {
      description = "SDK for NXP S32 devices";
      homepage = "https://www.nxp.com/design/design-center/software/development-software/s32-sdk:S32SDK";
      license = lib.licenses.unfree;
    };
  }
  ''
    export HOME=$(pwd)
    wine ${exe} --accept_license_agreement /S
    cp -r .wine/drive_c/NXP/S32_SDK_S32K1xx_RTM_4.0.2 $out
  ''
