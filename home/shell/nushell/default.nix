{
  programs.nushell = {
    enable = true;

    settings = {
      show_banner = false;
    };
    shellAliases = {
      clr = "clear";
      fetch = "fastfetch";
    };
  };

  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };
}
