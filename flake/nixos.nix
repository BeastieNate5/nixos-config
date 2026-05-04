{ inputs, ... }:
{
  flake.nixosConfigurations = let
    mkHost = hostname:
      inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        } // (import ../hosts/default-settings.nix // import ../hosts/${hostname}/settings.nix);
        modules = [
          ../hosts/${hostname}/configuration.nix
          {
            nixpkgs.overlays = [ inputs.niri-src.overlays.default ];
          }
        ];
      };
  in
    {
      tailless = mkHost "tailless";
      oracle = mkHost "oracle";
      yorha = mkHost "yorha";
    };
}
