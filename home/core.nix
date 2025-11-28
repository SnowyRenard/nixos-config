{ username, ... }: {
  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    stateVersion = "25.05";
  };

  imports = [
    ./shell

    # Window Manager
    ./hyprland.nix
    ./fht-compositor.nix
    ./rofi
    ./waybar
    ./wallust
  ];

  programs.home-manager.enable = true;
}
