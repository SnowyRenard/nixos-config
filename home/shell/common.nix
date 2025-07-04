{ pkgs, ... }: {
  home.packages = with pkgs; [
  ];

  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
  };
}
