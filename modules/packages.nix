{ self, ... }:
{
  # This module will be changejd
  flake.nixosModules.packages =
    {
      pkgs,
      inputs,
      ...
    }:
    let
      custom-astronaut = pkgs.sddm-astronaut.override {
        embeddedTheme = "hyprland_kath";
      };
    in
    {
      nixpkgs.config.allowUnfree = true;
      nixpkgs.overlays = [ inputs.niri-src.overlays.default ];

      environment.systemPackages = with pkgs; [
        # Desktop Applications
        vesktop
        obsidian
        aseprite
        nwg-look
        steam
        protonplus
        gamescope
        networkmanagerapplet
        audacity
        pcsx2
        wireshark
        postman
        obs-studio
        qbittorrent
        losslesscut-bin
        inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
        lunar-client

        # Tools
        vim
        pavucontrol
        bluez
        nh
        git
        zsh
        wget
        wl-clipboard
        neovim
        kitty
        brightnessctl
        fastfetch
        eza
        bat
        awww
        ranger
        ffmpeg
        file
        (pywal16.override {
          withColorz = true;
          withModernColorthief = true;
          withFastColorthief = true;
          withHaishoku = true;
        })
        btop
        mpv
        unzip
        ffmpeg
        tailscale
        samba
        wl-mirror
        inputs.snapsr.packages."${pkgs.stdenv.hostPlatform.system}".default
        self.packages."${pkgs.stdenv.hostPlatform.system}".fhs

        # WM stuff
        niri
        xwayland-satellite
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
        adwaita-icon-theme
        swaylock
        mako
        wofi
        waybar
        quickshell

        # Dev
        gcc
        #nodejs
        #go
        (python3.withPackages (
          p: with p; [
            requests
            pwntools
          ]
        ))

        #rustc
        #rustfmt
        #rustup
        #cargo
        tmux
        docker

        # Security stuff
        inputs.pwngdb.packages."${pkgs.stdenv.hostPlatform.system}".default
        #john
        hashcat
        hydra
        ghidra-bin
        nmap
        gobuster
        ffuf
        aircrack-ng
        wirelesstools

        # LSPs
        nixd

        # Other
        custom-astronaut
        kdePackages.qtmultimedia
        inputs.hatsune-miku-cursors.packages."${pkgs.stdenv.hostPlatform.system}".default
      ];

      programs.firefox.enable = true;
      programs.zsh.enable = true;
      programs.niri.enable = true;
      programs.xwayland.enable = true;
      programs.gamescope.enable = true;

      programs.steam.enable = true;

      virtualisation.docker.enable = true;
    };
}
