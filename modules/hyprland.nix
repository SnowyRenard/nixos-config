{ ... }: {
  systemd.services.display-manager.environment.XDG_CURRENT_DESKTOP = "X-NIXOS-SYSTEMD-AWARE";

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.displayManager = {
    enable = true;
    ly.enable = true;
  };
}
