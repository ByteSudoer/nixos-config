{ pkgs, username, ... }:
{
  programs.thunderbird = {
    enable = false;
    package = pkgs.thunderbird;
    profiles = {
      "${username}" = {
        isDefault = true;
        #name = "ByteSudoer";
        accountsOrder = [
          "work"
          "uni"
        ];

        settings = {
          "privacy.donottrackheader.enabled" = true;
          "mail.spellcheck.inline" = true;
          "general.smoothScroll" = true;
          # Auto enable extensions
          "extensions.autoDisableScopes" = 0;
        };

        # Search engine customization (optional)
        search = {
          force = true;
          default = "ddg";
          engines = {
            ddg = {
              name = "DuckDuckGo";
              urls = [ { template = "https://duckduckgo.com/?q={searchTerms}"; } ];
            };
            nixos = {
              name = "Nix Packages";
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
            };
          };
          order = [
            "ddg"
            "nixos"
          ];
        };
      };

    };

  };

  #home.packages = with pkgs; [ birdtray ];
}
