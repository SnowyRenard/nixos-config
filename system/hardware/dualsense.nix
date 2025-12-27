{ ... }:
{
  services.udev.extraRules = ''
    ACTION=="add|change", ATTRS{name}=="*Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
  '';
}
