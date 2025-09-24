{ config, ... }: {
  imports = [
    ../../system/default.nix
    ./hardware-configuration.nix
    
    ../../system/wm/hyprland.nix

    ../../system/app/steam.nix
    ../../system/app/gamemode.nix

    ../../system/hardware/backlight.nix

    ../../system/hardware/kernel.nix
    ../../system/hardware/time.nix
    
    ../../system/hardware/mesa.nix

    ../../system/security/firewall.nix
    ../../system/security/tailscale.nix
    ../../system/security/automount.nix
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

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  system.stateVersion = "25.05";
}
