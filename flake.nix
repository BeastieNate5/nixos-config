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
  };

  outputs =
    {
      nixpkgs,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      formatter."${system}" = nixpkgs.legacyPackages."${system}".nixfmt-tree;

      nixosConfigurations.tailless = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [ ./hosts/tailless/configuration.nix ];
      };

      nixosConfigurations.oracle = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [ ./hosts/oracle/configuration.nix ];
      };
    };
}
