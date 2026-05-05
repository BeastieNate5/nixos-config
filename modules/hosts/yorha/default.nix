{ self, inputs, ... }:
{
  flake.nixosConfigurations.yorha = inputs.nixpkgs.lib.nixosSystem
  {
    specialArgs = {
      inherit inputs;
    };

    modules = with self.nixosModules; [
      yorha-configuration
      yorha-hardware
      home-manager
      settings
    ];
  };
}
