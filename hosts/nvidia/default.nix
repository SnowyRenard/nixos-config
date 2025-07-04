{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/nvidia.nix

    ../../modules/system.nix
    # ../../modules/lvm.nix
    ../../modules/jellyfin.nix

    ../../hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "nixos-desktop";

  system.stateVersion = "25.05";
}
