{ self, inputs, ... }:
{
  flake.nixosConfigurations.oracle = inputs.nixpkgs.lib.nixosSystem
  {
    specialArgs = {
      inherit inputs;
    };

    modules = with self.nixosModules; [
      oracle-configuration
      oracle-hardware
      home-manager
      settings
    ];
  };
}
