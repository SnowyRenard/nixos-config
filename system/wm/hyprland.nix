{ ... }:

{
  imports = [
    ./wayland.nix
    ./pipewire.nix
  ];

  programs.hyprland.enable = true;
  services.displayManager.generic.environment.XDG_CURRENT_DESKTOP = "X-NIXOS-SYSTEMD-AWARE";
}
