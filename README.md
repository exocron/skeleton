A skeleton project for dual-firmware RP2040 and S32K148, with Nix build
scripts.

To build the S32K148 firmware, you must download the SDK from the NXP
website:
<https://www.nxp.com/design/design-center/software/development-software/s32-sdk:S32SDK>.
Place the file named `S32SDK_S32K1xx_RTM_4.0.2.exe` in the top-level
directory of this project, then run `NIXPKGS_ALLOW_UNFREE=1 nix-build`
to build both firmware images.

To build only firmware for RP2040 or S32K148, change directory into one
of the `rp2040` or `s32k148` directories and run `nix-build` in there.
