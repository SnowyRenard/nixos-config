{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Archives
    p7zip

    # Monitoring
    yazi
    nvtopPackages.amd

    # Utils
    dust
    tokei
    tealdeer
    ripgrep
    pipe-rename

    # Programming
    gcc
    gnumake
    rustup
    hyperfine
    # Cargo
    cargo-tarpaulin
    cargo-flamegraph
    cargo-all-features

    # Git
    jujutsu

    # Web Tools
    curl
    
    # Games
    heroic
    vesktop
    # Launcher
    xivlauncher
    prismlauncher
    # Modding
    openmw
    (limo.override { withUnrar = true; })
    # Emulation
    cemu
    rpcs3

    # Productivity
    qbittorrent

    proton-pass
    protonmail-desktop

    # Media
    ncspot
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
