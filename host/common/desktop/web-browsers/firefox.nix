{
  pkgs,
  desktop,
  extra,
  lib,
  hostname,
  ...
}:
let
  isDesktop = builtins.isString desktop;
  isExtra = builtins.isString extra;
  isInList = element: list: builtins.elem element list;
  hostnames = [
    "vm"
    "e16-nixos"
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
      # "Homepage" = {
      #   "URL" = "https://duckduckgo.com/";
      # };
      #Configure tracking protection
      # "EnableTrackingProtection" = {
      #   "Value" = true;
      #   #whether or not a user can change it.
      #   "Locked" = false;
      #   "Cryptomining" = true;
      #   "EmailTracking" = true;
      #   "Fingerprinting" = true;
      # };
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
