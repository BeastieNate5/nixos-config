{
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = true;
  };

  services.tailscale.enable = true;
  services.resolved.enable = true;
  services.openssh = {
    enable = true;
    openFirewall = false;
  };
}
