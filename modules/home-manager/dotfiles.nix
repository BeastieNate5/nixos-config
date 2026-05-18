{
  flake.homeModules.dotfiles =
    { config, ... }:
    let
      dotfiles = config.lib.file.mkOutOfStoreSymlink "/home/nate/nixos-config/dotfiles";
    in
    {
      config = {
        xdg.configFile = {
          "mako/config".source = "${dotfiles}/mako/config";
          "niri/config.kdl".source = "${dotfiles}/niri/config.kdl";
          nvim.source = "${dotfiles}/nvim";
          quickshell.source = "${dotfiles}/quickshell";
        };

        home.activation.createNiriConfigs = config.lib.dag.entryAfter [ "writeBoundary" ] ''
          mkdir -p "$HOME/.config/niri"
          touch $HOME/.config/niri/style.kdl
          touch $HOME/.config/niri/override.kdl
        '';
      };
    };
}
