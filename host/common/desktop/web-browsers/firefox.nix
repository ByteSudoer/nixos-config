{ pkgs
, desktop
, extra
, lib
, hostname
, ...
}:
let
  isDesktop = builtins.isString desktop;
  isExtra = builtins.isString extra;
  isInList = element: list: builtins.elem element list;
  hostnames = [
    "vm"
    "lenovo"
  ];
in
{
  programs.firefox = {
    package = pkgs.firefox;
    enable = isDesktop;
    languagePacks = [
      "en-GB"
      "en-US"
    ] ++ lib.optional isExtra "fr";
    policies = lib.mkIf (isInList hostname hostnames) {
      "Homepage" = {
        "URL" = "https://duckduckgo.com/";
      };
      "NewTabPage" = true;
      "NoDefaultBookmarks" = true;
      "SearchEngines" = {
        "Default" = "DuckDuckGo";
        "DefaultPrivate" = "DuckDuckGo";
        "Remove" = [
          "Bing"
          "eBay"
          "Google"
        ];
      };
    };
  };
}
