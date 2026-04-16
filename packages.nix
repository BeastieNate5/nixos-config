{
  pkgs,
  inputs,
  qylock-theme,
  ...
}:
let
  custom-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "hyprland_kath";
  };
  qylockTheme = pkgs.callPackage ./qylock-sddm.nix {
    theme = qylock-theme;
    rodinFont = ./fonts/FOT-Rodin-Pro-DB.otf;
  };
  qylock-lock = pkgs.callPackage ./qylock-lock.nix {
    qylock-sddm = qylockTheme;
    qylock-theme = qylock-theme;
  };
in
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Desktop Applications
    discord
    vesktop
    obsidian
    aseprite
    nwg-look
    steam
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
    noisetorch
    bluez
    nh
    git
    zsh
    starship
    btop
    wget
    wl-clipboard
    neovim
    kitty
    ly
    brightnessctl
    fastfetch
    eza
    bat
    awww
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
    (import ./fhs.nix { inherit pkgs; })

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
    qylock-lock

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
    qylockTheme
  ];

  programs.firefox.enable = true;
  programs.zsh.enable = true;
  programs.niri.enable = true;
  programs.xwayland.enable = true;
  programs.steam.enable = true;
  programs.gamescope.enable = true;
  programs.noisetorch.enable = true;

  virtualisation.docker.enable = true;
}
