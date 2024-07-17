{ pkgs, extra, ... }:
let
  isExtra = builtins.isString extra;
in
{
  programs.chromium = {
    enable = isExtra;
  };
}
