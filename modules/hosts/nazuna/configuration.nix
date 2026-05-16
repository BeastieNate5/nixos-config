{ self, ... }:

{
  flake.nixosModules.nazuna-configuration = {
    imports = with self.nixosModules; [
      server-profile
    ];

    boot.loader.efi.canTouchEfiVariables = false;
    boot.loader.generic-extlinux-compatible.enable = true;

    networking.hostName = "nazuna";

    system.stateVersion = "25.11";
  };
}
