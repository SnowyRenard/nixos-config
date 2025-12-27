{ ... }:
{
  services.udev.extraRules = ''
    ACTION=="add|change", ATTRS{name}=="DualSense Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
  '';
}
