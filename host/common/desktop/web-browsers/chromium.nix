{ pkgs, extra, ... }:
let
  isExtra = builtins.isString extra;
in
{
  programs.chromium = {
    package = pkgs.chromium;
    enable = isExtra;
  };
}
