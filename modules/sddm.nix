{ pkgs, qylock-theme, ... }:
{
  flake.nixosModules.sddm =
  {
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;

        theme = qylock-theme;
        extraPackages = [
        pkgs.quickshell
        pkgs.qt6.qtdeclarative
        pkgs.qt6.qtmultimedia
        pkgs.qt6.qtmultimedia
        pkgs.qt6.qtsvg
        pkgs.qt6.qt5compat
        pkgs.gst_all_1.gst-plugins-base
        pkgs.gst_all_1.gst-plugins-good
        ];

        settings = {
        Theme = {
            CursorTheme = "Adwaita";
            CursorSize = 24;
        };
        };
    };
  };
}
