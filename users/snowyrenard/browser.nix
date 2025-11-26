{
  pkgs,
  username,
  zen-browser,
  ...
}: {

  imports = [ zen-browser.homeModules.default ];
  home.sessionVariables.BROWSER = "zen";

  programs.zen-browser = {
    enable = true;

    policies = {
      DisableAppUpdate = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      OfferToSaveLogins = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };

    profiles.${username} = let
      containers = {
        Work = {
          color = "blue";
          icon = "briefcase";
          id = 1;
        };
        Personal = {
          color = "red";
          id = 2;
        };
      };
    in {
      isDefault = true;

      settings = {
        "zen.workspaces.continue-where-left-off" = true;
        "zen.view.compact.hide-tabbar" = true;
        "zen.view.compact.hide-toolbar" = true;
      };

      spacesForce = true;
      spaces = {
        "Work" = {
          id = "91";
          container = containers."Work".id;
        };
        "Media" = {
          id = "92";
          container = containers."Personal".id;
        };
        "Games" = {
          id = "93";
          container = containers."Personal".id;
        };
        "Programming" = {
          id = "94";
          container = containers."Work".id;
        };
        
      };

      containersForce = true;
      inherit containers;

      extensions = {
        force = true;
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          darkreader
          bitwarden
          sponsorblock
        ];
      }; 

      search = {
        force = true;
        default = "google";
        engines = {
          nix-packages = {
            name = "Nix Packages";
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "type"; value = "packages"; }
                { name = "channel"; value = "unstable"; }
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
                { name = "channel"; value = "unstable"; }
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
               { name = "release"; value = "master"; }
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

          g2a = {
            name = "G2A";
            urls = [{
              template = "https://g2a.com/search";
              params = [
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];

            definedAliases = [ "@g2a" "@g" "g2a" ];
          };
        };
      };

      bookmarks = {
        force = true;
        settings = [
          {
            name = "media";
            toolbar = true;
            bookmarks = [
              {
                name = "Youtube";
                url = "https://youtube.com";
              }
              {
                name = "Netflix";
                url = "https://netflix.com";
              }
            ];
          }
          {
            name = "programming";
            toolbar = true;
            bookmarks = [
              {
                name = "Github";
                url = "https://github.com";
              }
            ];
          }
          {
            name = "jisho";
            url = "https://jisho.org";
          }
        ];
      };
    };
  };
    
  programs = {
    firefox = {
      enable = false;

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

        search = {
          force = true;
          engines = {
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
        };

        bookmarks = {
          force = true;
          settings = [
            {
              name = "media";
              toolbar = true;
              bookmarks = [
                {
                  name = "Youtube";
                  url = "https://youtube.com";
                }
                {
                  name = "Netflix";
                  url = "https://netflix.com";
                }
              ];
            }
            {
              name = "programming";
              toolbar = true;
              bookmarks = [
                {
                  name = "Github";
                  url = "https://github.com";
                }
              ];
            }
            {
              name = "jisho";
              url = "https://jisho.org";
            }
          ];
        };
      };
    };
  };
}
