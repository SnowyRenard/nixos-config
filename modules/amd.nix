{ ... }: {
  # services.xserver.videoDrivers = [ "amdgpu" ];
  hardware = {
    # mesa RADV
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    # Opensource amd driver
    # amdgpu.amdvlk = {
    #   enable = true;
    #   support32Bit.enable = true;
    # };
  };
}
