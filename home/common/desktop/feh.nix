{ pkgs, ... }:
{
  programs.feh = {
    enable = true;
    package = pkgs.feh;
  };
}
