{ pkgs, ... }: {
  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.displayManager = {
    enable = true;
    ly.enable = true;
  };
}
