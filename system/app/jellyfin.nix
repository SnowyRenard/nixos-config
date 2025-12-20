{
  pkgs,
  username,
  ...
}: {

services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "${username}";
  };
  environment.systemPackages = with pkgs; [
    # Server
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
}
