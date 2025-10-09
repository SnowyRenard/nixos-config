{ pkgs, ... }: {

  wayland.windowManager.hyprland = {
    settings =  with pkgs; {
      "$browser" = "zen";
      "$terminal" = "${foot}/bin/footclient";
      "$drun" = "${rofi}/bin/rofi -show drun";

      # monitor
      monitor = [
        "eDP-1, disable"
        "eDP-2, disable"
      ];
    };
  };
}
