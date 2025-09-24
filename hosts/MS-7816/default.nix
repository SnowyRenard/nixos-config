{ ... }: {
  imports = [
    ../../system/default.nix
    ./hardware-configuration.nix
    
    ../../system/wm/hyprland.nix

    ../../system/app/steam.nix
    ../../system/app/gamemode.nix

    ../../system/hardware/bluetooth.nix
    ../../system/hardware/backlight.nix

    ../../system/hardware/kernel.nix
    ../../system/hardware/lvm.nix
    ../../system/hardware/time.nix
    
    ../../system/hardware/mesa.nix
    ../../system/hardware/nvidia.nix

    ../../system/security/firewall.nix
    ../../system/security/tailscale.nix
    ../../system/security/automount.nix
  ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "nixos-desktop";

  # Set your time zone.
  time.timeZone = "Europe/Brussels";

  # Nvidia Driver
  hardware.nvidia.open = false;

  system.stateVersion = "25.05";
}
