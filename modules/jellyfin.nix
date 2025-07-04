{
  pkgs,
  username,
  ...
}: {
  services.tailscale.enable = true;

  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "${username}";
  };
  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
}
