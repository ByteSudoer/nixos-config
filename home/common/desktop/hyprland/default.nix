{ pkgs, ... }:
{
  imports = [
    ./dunst.nix
    ./hyprland.nix
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

    ## Manage Wallpapers
    swww
    swww_randomize
    wev

    #Eq of xrandr
    wlr-randr

    # Task manager
    xfce.xfce4-taskmanager
  ];
}
