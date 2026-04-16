{
  description = "My NixOS Configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    snapsr = {
      url = "github:BeastieNate5/snapsr";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pwngdb = {
      url = "github:pwndbg/pwndbg";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-src =  {
      url = "github:YaLTeR/niri";
      inputs.rust-overlay.follows = "";
    };
  };

  outputs =
    {
      nixpkgs,
      niri-src,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      mkHost = hostname: nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
        } // (import ./hosts/default-settings.nix // import ./hosts/${hostname}/settings.nix);
        modules = [
          ./hosts/${hostname}/configuration.nix
          {
            nixpkgs.overlays = [ niri-src.overlays.default ];
          }
        ];
      };
    in
    {
      formatter."${system}" = nixpkgs.legacyPackages."${system}".nixfmt-tree;

      nixosConfigurations = {
        tailless = mkHost "tailless";
        oracle = mkHost "oracle";
        yorha = mkHost "yorha";
      };

    };
}
