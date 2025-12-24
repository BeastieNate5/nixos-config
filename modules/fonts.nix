{config, pkgs, ...}:
{
    fonts.packages = with pkgs; [
        texlivePackages.jetbrainsmono-otf
        texlivePackages.fontawesome
        nerd-fonts.symbols-only
        monocraft
    ];
}
