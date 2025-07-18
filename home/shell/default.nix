{
  imports = [
    ./nushell

    ./common.nix
    ./starship.nix
    ./terminals.nix
  ];

  # Allow home-manager to take controll over bash.
  programs.bash.enable = true;

  home.sessionVariables = {
    EDITOR = "hx";
    BROWSER = "firefox";
    TERMINAL = "kitty";
  };
}
