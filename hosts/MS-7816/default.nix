{ ... }: {
  imports = [
    ../../modules/system.nix
    ../../modules/lvm.nix
    ../../modules/jellyfin.nix
    ../../modules/hyprland.nix
    ../../modules/nvidia.nix

    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "nixos-desktop";
  services.tailscale.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Brussels";

  # Nvidia Driver
  hardware.nvidia.open = false;

  system.stateVersion = "25.05";
}
