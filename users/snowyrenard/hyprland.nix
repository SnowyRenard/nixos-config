{ pkgs, ... }: {

  wayland.windowManager.hyprland = {
    settings =  with pkgs; {
      "$browser" = "zen-beta";
      "$terminal" = "${foot}/bin/footclient";
      "$drun" = "${rofi}/bin/rofi -show drun";
    };
  };
}
