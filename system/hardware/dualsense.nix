{ ... }:
{
  services.udev.extraRules = ''
    ACTION=="add|change", ATTRS{name}=="Sony Interactive Entertainment Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
  '';
}
