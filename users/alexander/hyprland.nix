{ pkgs, ... }: {

  wayland.windowManager.hyprland = {
    settings =  with pkgs; {
      "$browser" = "${firefox}/bin/firefox";
      "$terminal" = "${foot}/bin/footclient";
      "$drun" = "${rofi}/bin/rofi -show drun";

      # vrr
      misc = {
        vfr = true;
        # vrr = 1;
      };
      # hdr
      experimental.xx_color_management_v4 = true;
      # monitor
      monitorv2 = [
        {
          output = "DP-1";
          mode = "highrr";
          bitdepth = 10;
          supports_wide_color = true;
          supports_hdr = true;
        }
        {
          output = "DP-9";
          mode = "highrr";
          bitdepth = 10;
          supports_wide_color = true;
          supports_hdr = true;
        }
      ];

    };
  };
}
