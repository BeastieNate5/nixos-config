{ self, ... }:

{
  flake.nixosModules.server-profile = {
    imports = with self.nixosModules; [
      core-packages
      systemd-boot
    ];

    services.getty.autologinUser = null;
  };
}
