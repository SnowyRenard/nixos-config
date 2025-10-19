{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Archives
    p7zip

    # Monotoring
    yazi
    nvtopPackages.full

    # Utils
    dust
    tokei
    ripgrep
    pipe-rename
    udisks

    # Programming
    gcc
    rustup

    # Git
    gitui

    # Web Tools
    curl
    
    # Games
    discord
    xivlauncher
    prismlauncher
    limo
    heroic
    rpcs3
    cemu
    vulkan-hdr-layer-kwin6
    gamescope
    gamescope-wsi

    # Productivity
    krita
    thunderbird

    # Media
    # jellyfin-media-player
    jellyfin-mpv-shim
    # jftui
    ncspot
  ];

  home.sessionVariables = {
    OBS_VKCAPTURE = 1;
    # FSR4_UPGRADE = 1; # proton-ge overwrite fsr3 to fsr4
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
      userName = "Snowy Renard";
      userEmail = "snowyrenard@gmail.com";
    };

    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
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
