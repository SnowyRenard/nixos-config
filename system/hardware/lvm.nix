# nixos.wiki/wiki/LVM
{
  boot.initrd.kernelModules = [
    "dm-cache-default" # lvm cache
  ];

  services.lvm.boot.thin.enable = true; # Required for lvm caching to work.
}
