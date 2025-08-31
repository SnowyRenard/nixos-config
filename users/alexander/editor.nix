{
  pkgs,
  ...
}: {
  home.sessionVariables.EDITOR = "kwrite";

  home.packages = with pkgs; [
    kdePackages.kate
  ];
}
