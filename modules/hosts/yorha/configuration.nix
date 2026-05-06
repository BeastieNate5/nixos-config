# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ self, ... }:
{
  flake.nixosModules.yorha-configuration = {
    imports = with self.nixosModules; [
      shared
      remote-builder
    ];

    services.remoteBuilder = {
      enable = true;
      sshIP = "0.0.0.0";
    };

    settings = {
      qylock-theme = "nier-automata";
    };

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia.open = true;
    hardware.nvidia.modesetting.enable = true;

    networking.hostName = "yorha";

    system.stateVersion = "25.05";
  };
}
