{
  flake.nixosModules.desktop-packages = { pkgs, inputs, ... }:
    {
      nixpkgs.overlays = [ inputs.niri-src.overlays.default ];

      environment.systemPackages = with pkgs; [
        vesktop
        aseprite
        audacity
        nwg-look
        steam
        protonplus
        pcsx2
        gamescope
        lunar-client
        networkmanagerapplet
        pavucontrol
        ffmpeg
        mpv
        wireshark
        postman
        obs-studio
        qbittorrent
        losslesscut-bin
        awww
        (pywal16.override {
          withColorz = true;
          withModernColorthief = true;
          withFastColorthief = true;
          withHaishoku = true;
        })
        niri
        xwayland-satellite
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
        adwaita-icon-theme
        wl-mirror
        wl-clipboard
        kitty
        mako
        wofi
        brightnessctl
        quickshell
        inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
        inputs.hatsune-miku-cursors.packages."${pkgs.stdenv.hostPlatform.system}".default
        inputs.anicursors.packages."${pkgs.stdenv.hostPlatform.system}".miyabi
      ];

      programs = {
        firefox.enable = true;
        niri.enable = true;
        xwayland.enable = true;
        gamescope.enable = true;
        wireshark.enable = true;
        steam.enable = true;
      };
    };
}
