{ self, ... }:
{
  flake.nixosModules.common-profile = {
    imports = with self.nixosModules; [
      core-packages
      security-packages
      openssh
      resolved
      tailscale
      users
      network-manager
      nix-ld
      nix-settings
    ];

    time.timeZone = "America/New_York";
  };
}
