{
  pkgs,
  config,
  ...
}: {
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  wayland.windowManager.hyprland = {
    enable = true;
  
    settings = {
      "$mod" = "SUPER";
      "$browser" = "firefox";
      "$terminal" = "kitty -1";
      "$drun" = "rofi -show drun";

      bind = [
        "$mod, W, exec, $browser"
        "$mod, D, exec, $drun"
        "$mod, T, exec, $terminal"
        "$mod, Return, exec, $terminal"

        "$mod SHIFT, Q, killactive"
        "$mod SHIFT, E, exit"

        "$mod SHIFT, F, fullscreen"
        "$mod, F, fullscreen , 1"
        "$mod, N, togglefloating"
        "$mod, V, togglesplit"
      ]
      ++ (
        # workspaces
        builtins.concatLists (builtins.genList (i:
          let ws = i + 1;
          in [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        )
        9)
      );
    };
  };

  home.pointerCursor = {
    # gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  # gtk = {
  #   enable = true;

  #   # theme = {};

  #   iconTheme = {
  #     package = pkgs.kora-icon-theme;
  #     name = "kora";
  #   };

  #   font = {
  #     name = "Fira Code Nerd Font";
  #     size = 11;
  #   };
  # };
}
