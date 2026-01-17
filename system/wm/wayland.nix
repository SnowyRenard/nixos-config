{
  imports = [
    ./pipewire.nix
    ./fonts.nix
  ];

  services.displayManager = {
    enable = true;
    ly.enable = true;
  };  
}
