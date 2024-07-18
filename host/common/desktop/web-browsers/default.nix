{ lib, extra, desktop, ... }:
let
  isDesktop = builtins.isString desktop;
  isExtra = builtins.isString extra;
in
{
  imports = lib.optional isDesktop ./firefox.nix
    ++ lib.optional isExtra ./chromium.nix;

}
