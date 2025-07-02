{ config, ... }: {
  imports = [
    ./nushell

    ./common.nix
    ./starship.nix
    ./terminals.nix
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    BROWSER = "firefox";
    TERMINAL = "kitty";
  };
}
