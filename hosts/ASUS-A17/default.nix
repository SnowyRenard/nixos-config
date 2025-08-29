{ config, ... }: {
  imports = [
    ../../modules/system.nix
    ../../modules/hyprland.nix
    ../../modules/bluetooth.nix
    ../../modules/nvidia.nix
    ../../modules/amd.nix

    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # External monitor brightness control for hypridle.
  boot.extraModulePackages = [config.boot.kernelPackages.ddcci-driver];
  boot.kernelModules = ["i2c-dev" "ddcci_backlight"];

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "nixos-laptop";
  services.tailscale.enable = true;

  services.power-profiles-daemon.enable = true;
  # Do not sleep if external display is connected.
  services.logind.settings = {
    Login.HandleLidSwitch = "poweroff";
    Login.HandleLidSwitchExternalPower = "lock";
    Login.HandleLidSwitchDocked = "ignore";
  };

  # Nvidia Driver
  hardware.nvidia.open =  true;

  system.stateVersion = "25.05";
}
