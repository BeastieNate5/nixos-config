{
  config,
  pkgs,
  username,
  inputs,
  ...
}:
let
  dotfiles = config.lib.file.mkOutOfStoreSymlink "/home/nate/nixos-config/dotfiles";
in
{
  imports = [
    inputs.nix-doom-emacs-unstraightened.hmModule
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

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
      plugins = [
        "git"
        "colored-man-pages"
      ];
    };

  };

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;

  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = tokyo-night-tmux;
        extraConfig = ''
          set -g @tokyo-night-tmux_theme storm
          set -g @tokyo-night-tmux_transparent 1
        '';
      }
    ];
    extraConfig = ''
      unbind C-b

      set -g prefix C-s

      set -g mouse on

      set -g base-index 1
      setw -g pane-base-index 1

      set -g renumber-windows on

      bind -r "<" swap-window -d -t -1
      bind -r ">" swap-window -d -t +1

      bind Space last-window

      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %

      set -sg escape-time 10

      bind r source-file ~/.config/tmux/tmux.conf
    '';
  };

  programs.starship.enable = true;

  programs.git = {
    enable = true;

    settings = {
      user = {
        email = "nhagan345@gmail.com";
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

  programs.doom-emacs = {
    enable = true;
    doomDir = ./dotfiles/doom;
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
