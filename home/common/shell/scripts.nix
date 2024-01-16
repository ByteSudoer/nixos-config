{ pkgs, ... }: {
  home.packages = with pkgs;[
    defaultLayout
    fehrandom
    get_weather
    lock
    picom_toggle
    sp
    tmuxSession
    wallpapers
    templateInit
  ];
}
