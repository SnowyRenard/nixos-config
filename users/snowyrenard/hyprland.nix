{ ... }: {

  wayland.windowManager.hyprland = {
    settings = {
      input = {
        kb_layout = "us, us";
        kb_variant = " , colemak_dh";
        kb_options = "grp:win_space_toggle";
      };
      # vrr
      misc = {
        vfr = true;
        # vrr = 1;
      };
      # hdr
      experimental.xx_color_management_v4 = true;

      # monitor
      monitor = [
        "eDP-1, disable"
        "eDP-2, disable"
      ];
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
