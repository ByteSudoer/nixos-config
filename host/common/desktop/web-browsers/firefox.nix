{ pkgs, desktop, extra, ... }:
let
  isDesktop = builtins.isString desktop;
  isExtra = builtins.isString extra;
in
{
  programs.firefox = {
    package = pkgs.firefox;
    enable = isDesktop;
    languagePacks = [
      "en-GB"
      "en-US"
    ] ++ isExtra [ "fr" ];
  };
}
