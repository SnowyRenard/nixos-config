{ pkgs, ... }: {

  wayland.windowManager.hyprland = {
    settings =  with pkgs; {
      "$browser" = "zen-beta";
      "$terminal" = "${foot}/bin/footclient";
      "$drun" = "${rofi}/bin/rofi -show drun";
      input = {
        kb_layout = "us";
        kb_variant = ",canary";
        kb_options = "grp:alt_shift_toggle";
      };
      monitorv2 = [
        {
          output = "HDMI-A-1";
          mode = "highres";
        }
      ];
    };
  };
}
