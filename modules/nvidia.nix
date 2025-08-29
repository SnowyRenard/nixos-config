# nixos.wiki/wiki/Nvidia
{ pkgs, config, ... }: {
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [ nvidia-vaapi-driver ];
    };
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;

      powerManagement = {
        enable = true;
        finegrained = false;
      };

      dynamicBoost.enable = true;

      nvidiaSettings = false;
    };
  };
}
