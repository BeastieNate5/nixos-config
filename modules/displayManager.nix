{pkgs, ...}: {
    services.displayManager.sddm = {
        enable = true;
        theme = "${pkgs.sddm-astronaut}/share/sddm/themes";
    };

    services.displayManager.sddm.wayland.enable = true;
}
