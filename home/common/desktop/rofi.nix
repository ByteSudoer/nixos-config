{ pkgs, desktop, ... }:
let
  rofi_package =
    if desktop == "hyprland" then "rofi-wayland"
    else "rofi";
in
{
  programs.rofi = {
    enable = true;
    package = pkgs.${rofi_package};

  };
  xdg.configFile.rofi = {
    source = ../../../config/rofi;
    recursive = true;
  };
}
