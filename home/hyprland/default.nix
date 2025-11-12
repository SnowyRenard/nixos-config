{
  pkgs,
  config,
  ...
}: {
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  home.sessionVariables = {
    SWWW_TRANSITION = "none";
  };

  home.packages = with pkgs; [
    (
      writers.writeNuBin "swww_randomize" /*nu*/''
          # This script will randomly go through the files of a directory, setting it
          # up as the wallpaper at regular intervals
          def main [dir: path, time: duration] {
            loop {
              if (hyprctl clients -j | from json | get fullscreen | all {$in == 0}) {
                let file = (select_file $dir)

                update_colors ($file.name | get 0)
              }

              sleep $time
            }
          }

          # Select a random file within a directory
          def select_file [dir: path] {
            let input_dir = ($"($dir)/**/*" | into glob) # glob is required to format because magic?
            let files = ls $input_dir | where type == file # Get all the eligible files
            let index = random int ..($files | length) # Select a random number
            $files | select $index # Return the actual file
          }

          # Update the environment based upon the path to an image
          def update_colors [img: path] {
            [
              (${wallust}/bin/wallust run $img --quiet -s | ignore; pkill waybar -SIGUSR2 | ignore),
              (${imagemagick}/bin/magick $img -gravity center -extent 1.005:1 ~/.cache/rofi.bmp),
              (${swww}/bin/swww img $img),
            ] | par-each { $in }
          }
        ''
      )
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;

    # App settings
    settings = {
      "$mod" = "SUPER";

      exec-once = [
        "hyprctl setcursor Bibata-Modern-Classic 16"
        "swww_randomize ~/Pictures/Backgrounds/Art/ 300sec"
      ];

      source = [
        "${config.xdg.cacheHome}/wallust/hypr-colors.conf"
        "~/Pictures/Backgrounds/background.conf"
      ];

      input.follow_mouse = 2;
  
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

      experimental.xx_color_management_v4 = true;
      monitorv2 = [
        {
          output = "";
          mode = "highrr";
          scale = 1;
          bitdepth = 10;
        }
      ];

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

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          shadow_passes = 2;
        }
      ];
    };
  };
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";       # avoid starting multiple hyprlock instances.
        before_sleep_cmd = "loginctl lock-session";    # lock before suspend.
        after_sleep_cmd = "hyprctl dispatch dpms on";  # to avoid having to press a key twice to turn on the display.
      };
      listener = [
        {
            timeout = 90;#sec
            # ddcci is for external monitor support.
            on-timeout = "${pkgs.brillo}/bin/brillo -el -O && ${pkgs.brillo}/bin/brillo -el -S 10%";         # set monitor backlight to minimum, avoid 0 on OLED monitor.
            on-resume = "${pkgs.brillo}/bin/brillo -el -I";                 # monitor backlight restore.
        }
        
        # { 
        #     timeout = 90;#sec
        #     on-timeout = "${pkgs.brightnessctl}/bin/brightnessctl -sd *:kbd_backlight set 0"; # turn off keyboard backlight.
        #     on-resume = "${pkgs.brightnessctl}/bin/brightnessctl -rd *:kbd_backlight";        # turn on keyboard backlight.
        # }
        
        # {
        #     timeout = 60;# 1min
        #     on-timeout = "loginctl lock-session";            # lock screen when timeout has passed
        # }
        
        {
            timeout = 300;# 5min
            on-timeout = "hyprctl dispatch dpms off";                            # screen off when timeout has passed
            on-resume = "hyprctl dispatch dpms on && ${pkgs.brillo}/bin/brillo -el -I";          # screen on when activity is detected after timeout has fired.
        }
      ];
    };
  };

  services.swww.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;

    config = {
       common.default = ["gtk"];
       hyprland.default = ["gtk" "hyprland"];
     };

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };
}
