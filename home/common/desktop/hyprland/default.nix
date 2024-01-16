{ pkgs, ... }:
{
  imports = [
    ./dunst.nix
    ./hyprland.nix
    ./swaylock.nix
    ./waybar.nix
    ./wlogout.nix
    ./wofi.nix
  ];
  home.packages = with pkgs; [
    #Control Brightness
    brightnessctl
    #Clipman manager
    copyq

    #GTK Apps
    lxappearance
    nwg-look
    glib

    #Spotify Control 
    playerctl

    ## Manage Wallpapers
    swww
    swww_randomize
    wev

    xwaylandvideobridge

    #Eq of xrandr
    wlr-randr

    # Task manager
    xfce.xfce4-taskmanager
  ];
}
