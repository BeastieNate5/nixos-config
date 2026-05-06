{
  flake.nixosModules.bundle = {
    imports = [
      ./modules/hosts/yorha
      ./modules/services/pipewire.nix
      ./modules/services/openssh.nix
      ./modules/services/tailscale.nix
    ];
  };
}
