{ self, ... }:
{
  flake.nixosModules.shared = {
    imports = with self.nixosModules; [
      bluetooth
      firewall
      fonts
      grub
      network-manager
      nix-ld
      nix-settings
      openssh
      packages
      pipewire
      plymouth
      resolved
      sddm
      users
      tailscale
    ];

    config = {
      # putting these here for now
      programs.dconf.enable = true;
      time.timeZone = "America/New_York";
    };
  };
}
