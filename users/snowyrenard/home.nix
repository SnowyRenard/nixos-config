{ pkgs, ... }: {
  imports = [
    ../../home/core.nix

    ../../home/shell
    ../../home/programs

    ../../home/hyprland    
    ../../home/rofi
    ../../home/waybar
    ../../home/wallust
  ];

  programs.git = {
    enable = true;
    userName = "Snowy Renard";
    userEmail = "snowyrenard@gmail.com";
  };
}
