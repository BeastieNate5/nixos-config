{ ... }:
{
    home.username = "nate";
    home.homeDirectory = "/home/nate";

    home.stateVersion = "25.05";

    programs.home-manager.enable = true;

    programs.zsh = {
        enable = true;
        oh-my-zsh = {
            enable = true;
            plugins = ["git" "colored-man-pages" "zsh-syntax-highlighting" "zsh-autosuggestions" "nix-shell"];
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
}

