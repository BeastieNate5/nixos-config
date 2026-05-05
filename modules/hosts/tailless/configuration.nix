{
  flake.nixosModules.tailless-configuration = { self, ... }:
  {
    imports = with self.nixosModules; [
      shared
      distributedBuilds
    ];

    settings = {
      qylock-theme = "wuwa";
    };

    powerManagement.cpuFreqGovernor = "performance";
    networking.hostName = "tailless";

    system.stateVersion = "25.05";
  };
}
