{ pkgs, ... }: {
  programs.gamemode = {
    enable = true;
    enableRenice = true;

    settings = {
      general = {
        softrealtime = "auto";
        renice = 10;
      };
    };
  };

  programs.steam = {
    enable = true;

    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;

    extraPackages = with pkgs; [ gamemode ];
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };
}
