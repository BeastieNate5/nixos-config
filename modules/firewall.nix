{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [  ];
    trustedInterfaces = [ "tailscale0" ];
  };
}
