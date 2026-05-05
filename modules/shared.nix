{
  flake.nixosModules.shared = { self }:
  {
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
    ];

    config = {
      # putting these here for now
      programs.dconf.enable = true;
      time.timeZone = "America/New_York";
    };
  };
}
