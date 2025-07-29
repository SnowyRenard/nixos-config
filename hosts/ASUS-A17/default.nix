{ ... }: {
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

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "nixos-laptop";
  services.tailscale.enable = true;

  # Nvidia Driver
  hardware.nvidia.open =  true;

  system.stateVersion = "25.05";
}
