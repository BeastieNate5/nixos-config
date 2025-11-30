{pkgs, inputs, ...}:
{
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        # Desktop Applications
        discord
        nwg-look
        inputs.zen-browser.packages."${system}".default

        # Tools
        vim
        git
        zsh
        wget
        neovim
        kitty
        ly
        brightnessctl
        fastfetch
        eza
        swww
        file
        pywal
        colorz

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
        gcc
        nodejs
        go
        rustc
        rustfmt
        rustup
        cargo
        tmux

        # LSPs
        gopls
        typescript-language-server
        rust-analyzer
    ];

    programs.firefox.enable = true;
    programs.zsh.enable = true;
    programs.niri.enable = true;
    programs.xwayland.enable = true;
}
