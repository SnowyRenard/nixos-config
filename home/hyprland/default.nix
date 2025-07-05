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

      exec-once = [
        "hyprctl setcursor Bibata-Modern-Classic 16"
      ];

      source = [
        "../../.cache/wallust/hypr-colors.conf"
      ];

      input = {
        kb_layout = "us, us";
        kb_variant = " , colemak_dh";
        kb_options = "grp:win_space_toggle";
      };
  
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 3;
        "col.active_border" = "rgb($color10)";
        "col.inactive_border" = "rgba(ffffffbb)";

        layout = "dwindle";
      };

      decoration = {
        rounding = 10;

        blur = {
          enabled = true;
          size = 2;
          passes = 1;
          new_optimizations = "on";

        };

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
      };

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

        "$mod, left,	movefocus, l"
		    "$mod, right,	movefocus, r"
		    "$mod, up,	movefocus, u"
		    "$mod, down,	movefocus, d"

		    "$mod, H,	movefocus, l"
		    "$mod, L,	movefocus, r"
		    "$mod, K,	movefocus, u"
		    "$mod, J,	movefocus, d"

		    "$mod SHIFT, left,	movewindow, l"
		    "$mod SHIFT, right,	movewindow, r"
		    "$mod SHIFT, up,	movewindow, u"
		    "$mod SHIFT, down,	movewindow, d"

		    "$mod SHIFT, H,	movewindow, l"
		    "$mod SHIFT, L,	movewindow, r"
		    "$mod SHIFT, K,	movewindow, u"
		    "$mod SHIFT, J,	movewindow, d"
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

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
  };

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };
}
