# nixos.wiki/wiki/LVM
{ pkgs, ... }: {
  boot.initrd.kernelModules = [
    "dm-chache-default" # lvmcache
  ];

  services.lvm.boot.thin.enable = true; # Required for lvm caching to work/
}
