{pkgs,...}:{
  home.packages = with pkgs;[
    scripts.defaultLayout
    scripts.fehrandom
    scripts.lock
    scripts.picom_toggle
    scripts.sp
    scripts.tmuxSession
    scripts.wallpapers
    templateInit
  ];
}