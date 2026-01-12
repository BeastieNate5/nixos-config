{ pkgs, inputs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Desktop Applications
    discord
    nwg-look
    steam
    gamescope
    networkmanagerapplet
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default

    # Tools
    vim
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
    gopls
    typescript-language-server
    rust-analyzer
    nixd
  ];

  programs.firefox.enable = true;
  programs.zsh.enable = true;
  programs.niri.enable = true;
  programs.xwayland.enable = true;
  programs.steam.enable = true;

  virtualisation.docker.enable = true;
}
