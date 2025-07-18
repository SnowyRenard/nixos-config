{
  ...
}: {
  programs.wallust = {
    enable = true;

    settings = {
      backend = "resized";
      threshold = 20;

      color_space = "lch";
      check_contrast = true;

      palette = "dark16";
      alpha = 75;

      templates = {
        dir.template = ./templates;
        dir.target = "~/.cache/wallust";
      };
    };
  };
}
