{ ... }:
{
  programs.rofi = {
    enable = true;
    font = "Fira Code Mono 10";
    terminal = "\${pkgs.kitty}/bin/kitty --single-instance";
    theme = ./configs/config.rasi;
  };
  
  home.file.".config/rofi" = {
    source = ./configs;
    recursive = true;
  };
}
