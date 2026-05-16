{ self, ... }:

{
  flake.nixosModules.nazuna-configuration = {
    imports = with self.nixosModules; [
      server-profile
    ];

    boot.loader.efi.canTouchEfiVariables = false;

    networking.hostName = "nazuna";

    system.stateVersion = "25.11";
  };
}
