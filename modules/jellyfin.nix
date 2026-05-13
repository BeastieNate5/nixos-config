{
  flake.nixosModules.jellyfin = {config, ...}: {
    services.jellyfin = {
      enable = true;
      openFirewall = true;
    };

    fileSystems."/var/lib/jellyfin/media/anime" = {
      device = "/home/${config.settings.username}/Videos/anime";
      fsType = "none";
      options = [
        "bind"
        "ro"
        "nofail"
        "x-systemd.automount"
      ];
    };
  };
}
