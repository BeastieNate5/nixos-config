{ pkgs, inputs, ... }:
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
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default

    # Tools
    vim
    pavucontrol
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
    file
    pywal
    btop
    mpv
    ffmpeg
    tailscale
    samba
    wl-mirror
    inputs.snapsr.packages."${pkgs.stdenv.hostPlatform.system}".default

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
    #gcc
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
    ghidra-bin
    nmap
    gobuster
    ffuf

    # LSPs
    nixd

    # other
    sddm-astronaut
  ];

  programs.firefox.enable = true;
  programs.zsh.enable = true;
  programs.niri.enable = true;
  programs.xwayland.enable = true;
  programs.steam.enable = true;

  virtualisation.docker.enable = true;
}
