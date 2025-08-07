{
  pkgs,
  username,
  ...
}: {
  programs = {
    firefox = {
      enable = true;

      profiles.${username} = {
        isDefault = true;

        extensions = {
          force = true;
          packages = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            darkreader
            bitwarden
            sponsorblock
          ];
        }; 

        search.force = true;
        search.engines = {
          nix-packages = {
            name = "Nix Packages";
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };

          nix-options = {
            name = "Nix Options";
            urls = [{
              template = "https://search.nixos.org/options";
              params = [
                { name = "type"; value = "options"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@no" ];
          };

          nix-wiki= {
            name = "Nix Wiki";
            urls = [{
              template = "https://nixos.wiki/wiki/{searchTerms}";
            }];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@nw" ];
          };
          
          home-manager-Options = {
           name = "Home Manager Options";
           urls = [{
             template = "https://home-manager-options.extranix.com/{searchTerms}";
             params = [
               { name = "query"; value = "{searchTerms}"; }
             ];
           }];

           icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
           definedAliases = [ "@hm" ];
          };

          jisho = {
            name = "Jisho";
            urls = [{
              template = "https://jisho.org/search/{searchTerms}";
            }];

            definedAlias = [ "@js" ];
          };

          youtube = {
            name = "Youtube";
            urls = [{
              template = "https://youtube.com/results";
              params = [
                { name = "search_query"; value = "{searchTerms}"; }
              ];
            }];

            definedAliases = [ "@yt" ];
          };

          wallhaven = {
            name = "Wallhaven";
            urls = [{
              template = "https://wallhaven.cc/search";
              params = [
                { name = "q"; value = "{searchTerms}"; }
              ];
            }];

            definedAliases = [ "@wh" ];
          };
        };

        bookmarks = {
          force = true;
          settings = [];
        };
      };
    };
  };
}
