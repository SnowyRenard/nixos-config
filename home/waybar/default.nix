{ pkgs, ... }: {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";

        margin-top = 5;
        margin-bottom = -5;
        margin-left = 10;
        margin-right = 10;
        spacing = 0;

        include = [./modules.json];

        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "hyprland-window"
        ];
        modules-right = [
          "backlight"
          "battery"
          "pulseaudio"
          "network"
          "clock"
          "tray"
        ];

      };
    };

    style = ./style.css;
  };
}
