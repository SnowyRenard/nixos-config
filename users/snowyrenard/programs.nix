{ pkgs, ... }:
{
  home.packages = with pkgs; [
    #########
    # Utils #
    #########
      # Archives
      p7zip
      # File System
      dust
      ripgrep
      pipe-rename
      # Monitoring
      yazi
      nvtopPackages.amd
      # Web
      curl
      # Extra
      tokei
      tealdeer

    ###############
    # Programming #
    ###############
      # Compilers
      gcc
      gnumake
      zig
      rustup
      # Cargo
      cargo-tarpaulin
      cargo-flamegraph
      cargo-all-features
      # code tools
      hyperfine
      norminette
      # Git
      jujutsu

    #########  
    # Games #
    #########
      # Launcher
      heroic
      xivlauncher
      prismlauncher
      # Modding
      openmw
      (limo.override { withUnrar = true; })
      # Emulation
      cemu
      rpcs3

    ################
    # Productivity #
    ################
      # Communication
      vesktop
      # File sharing
      qbittorrent
      # Proton
      proton-pass
      protonmail-desktop

    #########
    # Media #
    #########
      # Music
      ncspot
      # Jellyfin
      jellyfin-mpv-shim
      jellyfin-desktop
  ];

  home.sessionVariables = {
    OBS_VKCAPTURE = 1;
    PROTON_FSR4_UPGRADE = 1;
    # PROTON_ENABLE_WAYLAND = 1;
    # PROTON_ENABLE_HDR = 1;
  };

  programs = {
    btop = {
      enable = true;
      package = pkgs.btop-rocm;
      
      settings = {
        theme_background = false;
        update_ms = 100;
      };
    };

    fastfetch = {
      enable = true;
      settings = {
        modules = [
          "title"
          "separator"
          "os"
          "host"
          "kernel"
          "uptime"
          "packages"
          "shell"
          "wm"
          "cpu"
          "gpu"
          "memory"
          "swap"
          "disk"
          "break"
          "colors"
        ];
      };
    };

    mangohud = {
      enable = true;
      enableSessionWide = true;

      settings = {
        no_display = true;
        preset = 3;
        full = true;
      };
    };

    git = {
      enable = true;
      settings.user = {
        name = "Snowy Renard";
        email = "snowyrenard@gmail.com";
      };
    };

    obs-studio = {
      enable = true;

      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-multi-rtmp
        obs-pipewire-audio-capture
        obs-vkcapture
      ];
    };

    anki = {
      enable = true;
      addons = with pkgs.ankiAddons; [
        review-heatmap
        passfail2
      ];
    };
  };
}
