{ config, username, ... }: {
  # Brillo
  hardware.brillo.enable = true;
  users.users.${username}.extraGroups = [ "video" ];

  # DDC/CI
  extraModulePackages = with config.boot.kernelPackages; [ddcci-driver];
  kernelModules = [ "i2c-dev" "ddcci_backlight" ];
}
