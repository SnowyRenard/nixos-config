{
  programs.nushell = {
    enable = true;

    settings = {
      show_banner = false;
    };
    shellAliases = {
      clear = "clr";
      fetch = "fastfetch";
    };
  };

  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };
}
