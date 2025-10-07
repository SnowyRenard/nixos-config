{ pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    consoleLogLevel = 0;
    kernel.sysctl = {
      "vm.swappiness" = 10;
    };
  };
}
