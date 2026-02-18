{ pkgs, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    theme = "sddm-astronaut-theme";
    extraPackages = [
      pkgs.sddm-astronaut
    ];
  };

  services.displayManager.sddm.wayland.enable = true;
}
