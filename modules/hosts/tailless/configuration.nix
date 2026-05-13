{ self, ... }:
{
  flake.nixosModules.tailless-configuration = {
    imports = with self.nixosModules; [
      shared
      distributedBuilds
      jellyfin
    ];

    settings = {
      qylock-theme = "wuwa";
    };

    powerManagement.cpuFreqGovernor = "performance";
    networking.hostName = "tailless";

    system.stateVersion = "25.05";
  };
}
