{
  fht-compositor,
  ...
}: {
  imports =  [ fht-compositor.homeModules.default ];

  programs.fht-compositor = {
    enable = true;
  }; 
}
