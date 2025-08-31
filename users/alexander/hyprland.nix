{ ... }: {

  wayland.windowManager.hyprland = {
    settings = {
      # vrr
      misc = {
        vfr = true;
        vrr = 1;
      };
      # hdr
      experimental.xx_color_management_v4 = true;
      debug.full_cm_proto = true;
      # monitor
      monitorv2 = [
        {
          output = "DP-1";
          mode = "highrr";
          # bitdepth = 10;
          # cm = "hdr";
          # sdr_min_luminance = 0.005;
          # sdr_max_luminance = 250;
          supports_wide_color = true;
          supports_hdr = true;
        }
        {
          output = "DP-9";
          mode = "highrr";
          # bitdepth = 10;
          # cm = "hdr";
          # sdr_min_luminance = 0.005;
          # sdr_max_luminance = 250;
          supports_wide_color = true;
          supports_hdr = true;
        }
      ];

    };
  };
}
