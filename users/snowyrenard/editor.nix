{
  pkgs,
  ...
}: {
  home.sessionVariables.EDITOR = "hx";

  home.packages = with pkgs; [
    nil
    markdown-oxide
  ];
    
  programs.helix = {
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
        rainbow-brackets = true;
        
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
    languages = {
      language-server.harper = with pkgs; {
        command = "${harper}/bin/harper-ls";
        args = [ "--stdio" ];
      };

      language = [{
        name = "rust";
        language-servers = [ "rust-analyzer" "harper" ]; 
      }
      {
        name = "markdown";
        language-servers = [ "harper" ];
      }];
    };
  };
}
