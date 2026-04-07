{
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.tailscale.enable = true;
  services.resolved.enable = true;
}
