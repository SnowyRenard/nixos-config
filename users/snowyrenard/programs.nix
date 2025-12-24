{ pkgs, nixpkgs-stable, ... }:
{
  home.packages = [
    # Archives
    pkgs.p7zip

    # Monitoring
    pkgs.yazi
    pkgs.nvtopPackages.amd

    # Utils
    pkgs.dust
    pkgs.tokei
    pkgs.ripgrep
    # pipe-rename

    # Programming
    pkgs.gcc
    pkgs.rustup
    pkgs.cargo-pgo
    pkgs.cargo-bump
    pkgs.cargo-flamegraph
    pkgs.cargo-tarpaulin
    pkgs.cargo-all-features

    # Git
    pkgs.jujutsu

    # Web Tools
    pkgs.curl
    
    # Games
    pkgs.vesktop
    nixpkgs-unstable.xivlauncher
    pkgs.prismlauncher
    (pkgs.limo.override { withUnrar = true; })
    pkgs.heroic
    pkgs.rpcs3
    pkgs.cemu
    pkgs.steam-run
    pkgs.lutris

    # Productivity
    pkgs.krita
    pkgs.thunderbird
    pkgs.qbittorrent

    # Media
    # jellyfin-media-player
    pkgs.jellyfin-mpv-shim
    pkgs.ncspot
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
