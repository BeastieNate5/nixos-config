{ inputs, ... }:
{
  flake.homeModules.doom-emacs =
    { pkgs, ... }:
    {
      imports = [ inputs.nix-doom-emacs-unstraightened.hmModule ];

      config = {
        programs.doom-emacs = {
          enable = true;
          emacs = pkgs.emacs-pgtk;
          doomDir = ../../dotfiles/doom;
        };
      };
    };
}
