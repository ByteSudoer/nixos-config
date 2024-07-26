{ pkgs, ... }:
{
  home.packages = with pkgs; [
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
