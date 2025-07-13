# nixos.wiki/wiki/LVM
{ pkgs, ... }: {
  boot.initrd.kernelModules = [
    "dm-cache-default" # lvmcache
  ];

  services.lvm.boot.thin.enable = true; # Required for lvm caching to work/
}
