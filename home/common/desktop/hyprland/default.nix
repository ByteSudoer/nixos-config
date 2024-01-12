{ pkgs, ... }:
{
  imports = [
    ./dunst.nix
    ./hyprland.nix
    ./waybar.nix
  ];
  home.packages = with pkgs;[
  ];
}
