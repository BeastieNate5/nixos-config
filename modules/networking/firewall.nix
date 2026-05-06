{
  flake.nixosModules.firewall = {
    config = {
      networking.firewall = {
        enable = true;
        allowedTCPPorts = [ ];
        trustedInterfaces = [ "tailscale0" ];
      };
    };
  };
}
