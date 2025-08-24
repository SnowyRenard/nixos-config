{
  programs.rofi = {
    enable = true;
    terminal = "\${pkgs.kitty}/bin/kitty --single-instance";
  };
  
  home.file.".config/rofi" = {
    source = ./configs;
    recursive = true;
  };
}
