{ pkgs, ... }:

{
  programs.steam = {
    enable = true;

    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;

    extraPackages = with pkgs; [ gamemode ];
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };
}
