{ self, ... }:

{
  flake.nixosModules.server-profile = {
    imports = with self.nixosModules; [
      common-profile
      systemd-boot
    ];

    services.getty.autologinUser = null;
  };
}
