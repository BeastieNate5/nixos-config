{ pkgs, ...}:
let
    themes = import ./themes.nix pkgs;
in
{
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "nodev";
    boot.loader.grub.efiSupport = true;
    boot.loader.grub.theme = themes.yorha;
}
