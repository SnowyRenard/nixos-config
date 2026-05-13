{
  pkgs,
  ...
}: {

services.jellyfin = {
    enable = true;
    openFirewall = true;
  };
  environment.systemPackages = with pkgs; [
    # Server
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
}
