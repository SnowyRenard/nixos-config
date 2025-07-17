{
  lib,
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

    # Programming
    gcc
    rustup

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
    # xivlauncher
    # prismlauncher

    anki
    jellyfin-media-player
  ];

  home.sessionVariables = {
    MANGOHUD = 1;
    MANGOHUD_CONFIG = "no_display";
    OBS_VKCAPTURE = 1;
  };

  programs = {
    helix = {
      enable = true;
      defaultEditor = true;

      settings = {
        theme = "onedark";

        editor = {
          bufferline = "multiple";
          color-modes = true;
          cursorline = true;
          completion-replace = true;
          lsp.display-inlay-hints = true;

          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };
          indent-guides = {
            render = true;
            skip-levels = 1;
          };
          soft-wrap = {
            enable = true;
          };
        };

        keys.normal = {
          "A-," = "goto_previous_buffer";
          "A-." = "goto_next_buffer";
          "A-w" = ":buffer-close";
        };
      };
      # languages = {};
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
