{
  flake.nixosModules.nix-settings =
    { inputs, ... }:
    {
      config = {
        nix = {
          settings.experimental-features = [
            "nix-command"
            "flakes"
          ];
          settings.trusted-users = [
            "root"
            "nate"
          ];
          nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
        };
      };
    };
}
