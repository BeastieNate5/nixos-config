{ self, ... }:

{
  flake.nixosModules.server-profile = {
    imports = with self.nixosModules; [
      common-profile
    ];

    services.getty.autologinUser = null;
  };
}
