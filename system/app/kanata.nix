{
  boot.kernelModules = [ "uinput" ];
  hardware.uinput.enable = true;

  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';
 
  services.kanata = {
    enable = true;
    keyboards = {
      default = {
        config = ''
          (defsrc
            grv 1 2 3 4 5 6 7 8 9 0
            q w e r t y u i o p [ ] \
            a s d f g h j k l ; '
            z x c v b n m , . /
           )
           (deflayer qwerty
            @grl 1 2 3 4 5 6 7 8 9 0
            q w e r t y u i o p [ ] \
            a s d f g h j k l ; '
            z x c v b n m , . /
           )
           (deflayer canary-angle
            @grl 1 2 3 4 5 6 7 8 9 0
            w l y p k z x o u ; [ ] \
            c r s t b f n e i a '
            j v d g q m h / , .
           )
           (defalias
             grl (tap-hold 200 200 grv (layer-toggle layers))
           
             qwr (layer-switch qwerty)
             cnr (layer-switch canary-angle)
           )
           (deflayer layers
            _ @qwr @cnr lrld _ _ _ _ _ _ _
            _ _ _ _ _ _ _ _ _ _ _ _ _
            _ _ _ _ _ _ _ _ _ _ _
            _ _ _ _ _ _ _ _ _ _
           )
        '';
        extraDefCfg = "process-unmapped-keys yes";
      };
    };
  };
}
