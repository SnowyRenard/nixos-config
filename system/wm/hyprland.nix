{ ... }:

{
  imports = [
    ./wayland.nix
    ./pipewire.nix
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
}
