{ self, inputs, ... }:

{
  flake.nixosConfigurations.nazuna = inputs.nixpkgs.lib.nixosSystem {
    system = "aarch64-linux";

    specialArgs = {
      inherit inputs;
    };

    modules = with self.nixosModules; [
      nazuna-configuration
      nazuna-hardware
      settings
    ];
  };
}
