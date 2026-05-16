{ self, ... }:
{
  flake.homeModules.common-profile = {
    imports = with self.homeModules; [
      env
      zsh
      nushell
      starship
      tmux
      git-config
      dotfiles
      ssh-config
      direnv
      btop
      ranger
    ];
  };
}
