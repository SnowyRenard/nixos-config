{ pkgs, config, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = with config.boot.kernelPackages; [];
    consoleLogLevel = 0;
    kernel.sysctl = {
      "vm.swappiness" = 10;
    };
  };
}
