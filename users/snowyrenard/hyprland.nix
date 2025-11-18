{ pkgs, ... }: {

  wayland.windowManager.hyprland = {
    settings =  with pkgs; {
      "$browser" = "zen";
      "$terminal" = "${foot}/bin/footclient";
      "$drun" = "${rofi}/bin/rofi -show drun";
    };
  };
}
