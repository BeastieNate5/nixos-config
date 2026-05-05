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
      home-manager
      settings
    ];
  };
}
