{ ... }:
{
    imports = [
        ./themes/theme.nix
    ];

    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "nodev";
    boot.loader.grub.efiSupport = true;

    grubThemes.yorha.enable = true;
}
