{ pkgs, ... }:
{
  programs.eww = {
    enable = false;
    package = pkgs.eww-wayland;
    configDir = ../../../../config/eww;
  };
}
