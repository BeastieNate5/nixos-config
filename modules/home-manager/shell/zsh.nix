{ ... }:
{
  flake.homeModules.zsh = { ... }:
  {
    config = {
        programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            c = "clear";
            n = "nvim";
            ls = "eza --icons";
            ll = "eza --icons -la";
            lt = "eza --tree --icons";
            po = "poweroff";
            ff = "fastfetch";
            ssh = "kitty +kitten ssh";
            barreload = "pkill waybar; niri msg action spawn -- 'waybar'";
        };
        oh-my-zsh = {
            enable = true;
            plugins = [
            "git"
            "colored-man-pages"
            ];
        };
      };
    };
  };
}
