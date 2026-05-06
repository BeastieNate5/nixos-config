{
  flake.homeModules.git-config =
  {

    config = {
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
    };
  };
}
