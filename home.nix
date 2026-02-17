{ config, ... }:
let
  dotfiles = config.lib.file.mkOutOfStoreSymlink "/home/nate/nixos-config/dotfiles";
in
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
            ssh = "kitty +kitten ssh";
            barreload = "pkill waybar; niri msg action spawn -- 'waybar'";
        };
        oh-my-zsh = {
            enable = true;
            plugins = ["git" "colored-man-pages"];
        };

    };

    programs.starship.enable = true;

    programs.git = {
        enable = true;

        settings = {
            user = {
                email = "nhagan345@gamil.com";
                name = "0x2B";
            };
        
            alias = {
                st = "status";
                ll = "log --oneline";
                cm = "commit -m";
                pl = "pull";
                ph = "push";
            };
        };
    };

    home.sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
        HISTFILE = "$HOME/.zhistory";
        HISTSIZE = 1000;
        SAVEHIST = 1000;
        _JAVA_AWT_WM_NONREPARENTING = 1;
    };

    xdg.configFile = {
        "mako/config".source = "${dotfiles}/mako/config";
        "niri/config.kdl".source = "${dotfiles}/niri/config.kdl";
        "kitty/kitty.conf".source = "${dotfiles}/kitty/kitty.conf";
        nvim.source = "${dotfiles}/nvim";
        quickshell.source = "${dotfiles}/quickshell";
    };
}

