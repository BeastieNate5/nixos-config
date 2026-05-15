{ self, ... }:

{
  flake.nixosModules.nazuna-configuration = {
    imports = with self.nixosModules; [
      server-profile
    ];

    networking.hostName = "nazuna";

    system.stateVersion = "25.11";
  };
}
