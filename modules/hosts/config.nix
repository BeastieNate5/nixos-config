{
  flake.nixosModules.settings = { lib, ... }:
  {
    options.settings = {
      username = lib.mkOption {
        type = lib.types.str;
        default = "nate";
      };

      qylock-theme = lib.mkOption {
        type = lib.types.str;
        default = "nier-automata";
      };

      grub-theme = lib.mkOption {
        type = lib.types.enum [ "futaba" "yorha" "lain" ];
        default = "yorha";
      };
    };
  };
}
