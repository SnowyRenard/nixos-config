{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/system.nix
    ../../modules/lvm.nix
    ../../modules/jellyfin.nix
    ../../modules/hyprland.nix

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

  # Nvidia Driver
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    graphics.enable = true;
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;

      powerManagement = {
        enable = true;
        finegrained = false;
      };

      open =  false;

      nvidiaSettings = false;
    };
  };

  system.stateVersion = "25.05";
}
