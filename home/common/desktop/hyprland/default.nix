{ pkgs, ... }:
{
  imports = [
    ./dunst.nix
    ./hyprland.nix
    ./waybar.nix
    ./wofi.nix
  ];
  home.packages = with pkgs; [
    #Clipman manager
    copyq

    ## Manage Wallpapers
    swww
    swww_randomize
    wev

    #Eq of xrandr
    wlr-randr
  ];
}
