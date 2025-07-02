{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [

  ];
}
