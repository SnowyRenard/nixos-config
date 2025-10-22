{
  home.sessionVariables = {
    TERM = "footclient";
    TERMINAL = "footclient";
  };

  programs.foot = {
    enable = true;
    server.enable = true;

    settings = {
      main = {
        shell = "nu";

        font = "Fira Code Nerd Font Mono:size=11";
        dpi-aware = "yes";
      };

      colors = {
        alpha = 0.75;
      };      
    };
  };

  xdg.desktopEntries = {
    foot = {
      name = "foot";
      noDisplay = true;
    };
    footclient = {
      name = "footclient";
      noDisplay = true;
    };
    foot-server = {
      name = "foot-server";
      noDisplay = true;
    };
  };
}
