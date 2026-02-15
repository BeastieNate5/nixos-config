{ ... }:

{
  imports = [
    ./modules/grub/bootloader.nix
    ./modules/users.nix
    ./modules/fonts.nix
    ./modules/services.nix
    ./modules/displayManager.nix
  ];
}
