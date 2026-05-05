{
  flake.nixosModules.users = {pkgs, username, ...}:
  {
    config = {
      users.users.${username} = {
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
