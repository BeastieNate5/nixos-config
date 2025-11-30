{
    description = "My NixOS Configuration flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        zen-browser = {
            url = "github:0xc000022070/zen-browser-flake";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = {self, nixpkgs, zen-browser}@inputs: {
            nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
	        system = "x86_64-linux";
            specialArgs = { inherit inputs; };
	        modules = [./configuration.nix];
	    };
    };
}
