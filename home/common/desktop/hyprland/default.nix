{ pkgs, ... }:
{
  imports = [
    # ./copyq.nix
    ./eww.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprsome.nix
    ./swaylock.nix
    ./waybar.nix
    ./wlogout.nix
    ./wofi.nix
  ];
  home.packages = with pkgs; [
    #Control Brightness
    brightnessctl
    copyq

    #GTK Apps
    nwg-look
    glib

    #Spotify Control
    playerctl

    grimblast

    #Notification Center
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
