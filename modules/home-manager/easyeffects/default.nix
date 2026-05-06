{
  flake.homeModules.easyeffects =
  {
    config = {
      services.easyeffects = {
        enable = true;
        extraPresets = {
          base-enhacning-perfect-eq = builtins.fromJSON (builtins.readFile ./presets/Bass_Enhancing_Perfect_EQ.json);
        };
      };
    };
  };
}
