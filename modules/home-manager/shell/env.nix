{
  flake.homeModules.env =
  {
    home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      HISTFILE = "$HOME/.zhistory";
      HISTSIZE = 1000;
      SAVEHIST = 1000;
      _JAVA_AWT_WM_NONREPARENTING = 1;
    };
  };
}
