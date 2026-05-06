{ self, ... }:
{
  flake.nixosModules.home-manager-config =
    { config, ... }:
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;

        users.${config.settings.username} = {
          home = {
            username = config.settings.username;
            homeDirectory = "/home/${config.settings.username}";
            stateVersion = "25.05";
          };

          imports = with self.homeModules; [
            kitty
            tmux
            env
            zsh
            easyeffects
            doom-emacs
            git-config
            ssh-config
            starship
            direnv
            dotfiles
          ];
        };
      };
    };
}
