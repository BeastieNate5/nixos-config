{
    description = "My NixOS Configuration flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        zen-browser = {
            url = "github:0xc000022070/zen-browser-flake";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        snapsr = {
            url = "github:BeastieNate5/snapsr";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = {self, nixpkgs, zen-browser, snapsr}@inputs: {
            nixosConfigurations.tailless = nixpkgs.lib.nixosSystem {
	        system = "x86_64-linux";
            specialArgs = { inherit inputs; };
	        modules = [./hosts/tailless/configuration.nix];
	    };

            nixosConfigurations.oracle = nixpkgs.lib.nixosSystem {
	        system = "x86_64-linux";
		specialArgs = { inherit inputs; };
	        modules = [./hosts/oracle/configuration.nix];
	    };
    };
}
