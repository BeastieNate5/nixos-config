{
  flake.homeModules.doom-emacs = { pkgs, inputs, ... }:
  {
    imports = [ inputs.nix-doom-emacs-unstraightened.hmModule ];

    programs.doom-emacs = {
      enable = true;
      emacs = pkgs.emacs-pgtk;
      doomDir = ../dotfiles/doom;
    };
  };
}
