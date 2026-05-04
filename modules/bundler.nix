{
  imports = [
    ./grub/bootloader.nix
    ./users.nix
    ./fonts.nix
    ./services.nix
    ./plymouth.nix
    ./displayManager.nix
    ./nixLD.nix
    ./firewall.nix
  ];
}
