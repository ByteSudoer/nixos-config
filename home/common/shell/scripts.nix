{ pkgs, ... }: {
  home.packages = with pkgs;[
    defaultLayout
    fehrandom
    get_weather
    lock
    mediaplayer
    picom_toggle
    sp
    tmuxSession
    wallpapers
    templateInit
  ];
}
