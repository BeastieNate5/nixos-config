{ ... }:
{
    home.username = "nate";
    home.homeDirectory = "/home/nate";

    home.stateVersion = "25.05";

    programs.home-manager.enable = true;

    programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            c = "clear";
            n = "nvim";
            ls = "eza --icons";
            ll = "eza --icons -la";
            lt = "eza --tree --icons";
            po = "poweroff";
            ff = "fastfetch";
        };
        oh-my-zsh = {
            enable = true;
            plugins = ["git" "colored-man-pages"];
        };

    };

    programs.starship.enable = true;

    home.sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
        HISTFILE = "$HOME/.zhistory";
        HISTSIZE = 1000;
        SAVEHIST = 1000;
        _JAVA_AWT_WM_NONREPARENTING = 1;
    };

    home.file = {
        ".config/mako/config".source = ./dotfiles/mako/config;
        ".config/niri/config.kdl".source = ./dotfiles/niri/config.kdl;
    };
}

