{
  flake.nixosModules.users = { config, pkgs, username, ... }:
  {
    config = {
      users.users.${config.settings.username} = {
        isNormalUser = true;
        shell = pkgs.zsh;
        extraGroups = [
          "wheel"
          "docker"
          "networkmanager"
          "wireshark"
        ];
      };
    };
  };
}
