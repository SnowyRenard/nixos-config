{ pkgs, ... }: {
  home.sessionVariables.TERMINAL = "kitty";
  
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.nerd-fonts.fira-code;
      name = "Fira Code";
      size = 11;
    };
    settings = {
    dynamic_background_opacity = true;
    background_opacity = 0.75;
      disable_ligatures = "cursor";
    };
  };
}
