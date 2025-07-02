{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # archives
    p7zip

    #utils
    dust
    btop
    yazi
    gitui
    tokei
    ripgrep

    fastfetch

    discord
  ];

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
  };
}
