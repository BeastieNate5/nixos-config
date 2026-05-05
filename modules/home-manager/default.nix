{
  flake.nixosModules.home-manager = { self, config, ... }:
  {
    home-manager = {
      programs.home-manager.enable = true;
      stateVersion = "25.05";

      users.${config.settings.username} = {
        username = config.settings.username;
        homeDirectory = "/home/${config.settings.username }";

        imports = with self.homeModules; [
          kitty
          easyeffects
          direnv
          starship
          tmux
          git-config
          doom-emacs
          zsh
          env
          dotfiles
          ssh-config
        ];
      };
    };
  };
}
