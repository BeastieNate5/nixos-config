{...}: {
    programs.sddm = {
        enable = true;
        theme = "astronaut";
    };

    services.displayManager.sddm.wayland.enable = true;
}
