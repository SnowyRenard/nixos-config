{ pkgs, ... }: {
  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;
    openFirewall = true;
  };
  services.open-webui = {
    enable = true;
    openFirewall = true;
  };
  # DNS fuckery
  # services.avahi.enable = true;
  # services.resolved.enable = true;
}
