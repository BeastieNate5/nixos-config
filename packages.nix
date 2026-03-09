{ pkgs, inputs, ... }:
let
  custom-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "hyprland_kath";
  };
in
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Desktop Applications
    discord
    obsidian
    nwg-look
    steam
    gamescope
    networkmanagerapplet
    audacity
    pcsx2
    wireshark
    postman
    obs-studio
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
    neovim
    kitty
    ly
    brightnessctl
    fastfetch
    eza
    bat
    swww
    ffmpeg
    file
    pywal
    btop
    mpv
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
    autopsy

    # LSPs
    nixd

    # Other
    custom-astronaut
    kdePackages.qtmultimedia
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
