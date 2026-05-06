{ self, inputs, ... }:
{
  flake.nixosConfigurations.yorha = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit inputs;
    };

    modules = with self.nixosModules; [
      yorha-configuration
      yorha-hardware
      inputs.home-manager.nixosModules.home-manager
      home-manager-config
      settings
    ];
  };
}
