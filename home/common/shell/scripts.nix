{ pkgs, ... }:
{
  home.packages = with pkgs; [
    battery_info
    defaultLayout
    fehrandom
    get_weather
    lock
    mediaplayer
    picom_toggle
    rofi_window
    sp
    tmuxSession
    wallpapers
    templateInit
  ];
}
