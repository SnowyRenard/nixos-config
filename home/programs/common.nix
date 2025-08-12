{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # Archives
    zip
    unzip
    p7zip

    # Monotoring
    yazi
    btop-rocm
    nvtopPackages.amd

    # Utils
    dust
    tokei
    ripgrep
    pipe-rename

    # Programming
    gcc
    rustup
    cargo-flamegraph

    # Git
    gitui

    # Web Tools
    curl
    wget
    
    # Games
    discord
    gamemode
    xivlauncher
    prismlauncher

    # Productivity
    krita
    obsidian
    # davinci-resolve

    # Study
    anki

    # Media
    jellyfin-media-player
  ];

  home.sessionVariables = {
    OBS_VKCAPTURE = 1;
    FSR4_UPGRADE = 1; # proton-ge overwrite fsr3 to fsr4
  };

  programs = {
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
  };
}
