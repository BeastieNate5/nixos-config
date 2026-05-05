{
  flake.homeModules.ssh-config = { config, ... }:
  {
    home.file.".ssh/config".text = ''
      Host github.com
        User git
        IdentityFile ~/.ssh/keys/github_rsa

      Host gitlab.com
        User git
        IdentityFile ~/.ssh/keys/gitlab_rsa

      Host acheron
        User ${config.settings.username}
        IdentityFile ~/.ssh/keys/acheron_id_rsa
        Port 6060

      Host yorha
        User ${config.settings.username}

      Host oracle
        User ${config.settings.username}

      Host tailless
        User ${username}
    '';
  };
}
