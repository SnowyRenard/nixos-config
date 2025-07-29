# nixos.wiki/wiki/Nvidia
{ config, ... }: {
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

      nvidiaSettings = false;
    };
  };
}
