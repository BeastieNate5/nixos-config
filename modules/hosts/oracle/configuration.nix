{
  flake.nixosModules.oracle-configuration = { self, ... }:
  {
    imports = with self.nixosModules; [
      shared
      distributedBuilds
    ];

    settings = {
      qylock-theme = "enfield";
    };

    networking.hostName = "oracle";

    system.stateVersion = "25.05";
  };
}
