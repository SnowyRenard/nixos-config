{ ... }:

{
  imports = [
    ./wayland.nix
    ./pipewire.nix
  ];

  systemd.services.display-manager.environment.XDG_CURRENT_DESKTOP = "X-NIXOS-SYSTEMD-AWARE";

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
}
