{
  flake.nixosModules.network-manager = {
    config = {
      networking.networkmanager = {
        enable = true;
        dns = "systemd-resolved";
      };
    };
  };
}
