{
  flake.homeModules.nushell = {
    programs.nushell = {
      enable = true;

      shellAliases = {
        c = "clear";
        n = "nvim";
        sshk = "kitty +kitten ssh";
        ff = "fastfetch";
        po = "poweroff";
      };

      configFile.text = ''
        $env.config = {
          show_banner: false
        }
      '';
    };
  };
}
