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
    btop-cuda
    nvtopPackages.full

    # Utils
    dust
    tokei
    ripgrep
    bluetui

    # Programming
    gcc
    rustup
    cargo-flamegraph

    # Git
    gitui

    # Web Tools
    curl
    wget
    qbittorrent
    
    # Games
    discord
    gamemode
    mangohud
    xivlauncher
    prismlauncher

    anki
    krita
    obsidian
    jellyfin-media-player
    protonvpn-gui
    networkmanagerapplet
  ];

  home.sessionVariables = {
    MANGOHUD = 1;
    MANGOHUD_CONFIG = "no_display";
    OBS_VKCAPTURE = 1;
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

    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };

    obs-studio = {
      enable = true;

    package = (
      pkgs.obs-studio.override {
        cudaSupport = true;
      }
    );

    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-multi-rtmp
      obs-pipewire-audio-capture
      obs-vaapi
      obs-vkcapture
    ];
    };
  };
}
