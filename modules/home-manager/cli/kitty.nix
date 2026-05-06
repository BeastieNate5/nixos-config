{
  flake.homeModules.kitty = {
    config = {
      programs.kitty = {
        enable = true;
        shellIntegration.enableZshIntegration = true;
        extraConfig = ''
          include theme.conf
        '';
      };
    };
  };
}
