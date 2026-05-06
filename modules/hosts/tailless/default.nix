{ self, inputs, ... }:
{
  flake.nixosConfigurations.tailless = inputs.nixpkgs.lib.nixosSystem
  {
    specialArgs = {
      inherit inputs;
    };

    modules = with self.nixosModules; [
      tailless-configuration
      tailless-hardware
      inputs.home-manager.nixosModules.home-manager
      home-manager-config
      settings
    ];
  };
}
