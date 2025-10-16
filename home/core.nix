{ username, ... }: {
  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    stateVersion = "25.05";
  };

  imports = [
    ./shell

    # Window Manager
    ./hyprland
    ./rofi
    # ./waybar
    ./wallust
  ];

  programs.home-manager.enable = true;
}
