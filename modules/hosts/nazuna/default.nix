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
      inputs.nixos-hardware.nixosModules.raspberry-pi-4
      inputs.home-manager.nixosModules.home-manager
      hm-server-config
      settings
    ];
  };
}
