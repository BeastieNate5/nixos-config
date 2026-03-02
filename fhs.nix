{ pkgs }:
pkgs.buildFHSEnv ( let
    base = pkgs.appimageTools.defaultFhsEnvArgs;
in base // {
    name = "fhs";
    targetPkgs = pkgs: (base.targetPkgs pkgs) ++ (with pkgs; [
        pkg-config
        ncurses
    ]);

    profile = "export FHS=1";
    runScript = "zsh";
    extraOutputsToInstall = ["dev"];
}
)

