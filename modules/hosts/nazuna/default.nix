{ self, inputs, ... }:

{
  flake.nixosConfigurations.nazuna = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit inputs;
    };

    modules = with self.nixModules; [
      nazuna-configuration
      nazuna-hardware
      settings
    ];
  };
}
