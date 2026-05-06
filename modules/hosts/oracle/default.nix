{ self, inputs, ... }:
{
  flake.nixosConfigurations.oracle = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit inputs;
    };

    modules = with self.nixosModules; [
      oracle-configuration
      oracle-hardware
      inputs.home-manager.nixosModules.home-manager
      home-manager-config
      settings
    ];
  };
}
