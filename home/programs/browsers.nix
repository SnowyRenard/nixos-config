{
  pkgs,
  config,
  username,
  ...
}: {
  programs = {
    # chromium = {
    #   enable = true;
    # };

    firefox = {
      enable = true;

      profiles.${username} = {
        bookmarks = {
        force = true;
          settings = [
            {
              name = "wikipedia";
              tags = [ "wiki" ];
              keyword = "wiki";
              url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
            }
            {
              name = "kernel.org";
              url = "https://www.kernel.org";
            }
            "separator"
            {
              name = "Nix sites";
              toolbar = true;
              bookmarks = [
                {
                  name = "homepage";
                  url = "https://nixos.org/";
                }
                {
                  name = "wiki";
                  tags = [ "wiki" "nix" ];
                  url = "https://wiki.nixos.org/";
                }
                {
                  name = "home-manager";
                  tags = [ "wiki" "nix" "home-manager" ];
                  url = "https://nix-community.github.io/home-manager/";
                }
              ];
            }
          ];
        };
      };
    };
  };
}
