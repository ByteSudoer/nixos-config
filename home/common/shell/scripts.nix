{ pkgs, ... }: {
  home.packages = with pkgs;[
    defaultLayout
    fehrandom
    lock
    picom_toggle
    sp
    tmuxSession
    wallpapers
    templateInit
  ];
}
