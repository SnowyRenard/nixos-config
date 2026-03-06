{ pkgs, config, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = with config.boot.kernelPackages; [];
    kernelModules = [ "uinput" ];
    consoleLogLevel = 0;
    kernel.sysctl = {
      "vm.swappiness" = 10;
    };
  };
  hardware.uinput.enable = true;
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';

  users.groups.uinput = {};
}
