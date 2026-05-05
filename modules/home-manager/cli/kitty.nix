{
  flake.homeModules.kitty =
  {
    programs.kitty = {
      enable = true;
      shellIntegration.enableZshIntegration = true;
      extraConfig = ''
        include theme.conf
      '';
    };
  };
}
