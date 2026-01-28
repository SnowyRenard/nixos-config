{
  imports = [
    ./pipewire.nix
    ./fonts.nix
  ];

  services.displayManager = {
    enable = true;
    ly.enable = true;
    environment.XDG_CURRENT_DESKTOP = "X-NIXOS-SYSTEMD-AWARE";
  };  
}
