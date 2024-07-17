{ pkgs, desktop, ... }: {
  imports = [
    (./. + "/${desktop}")

    ./alacritty.nix
    ./betterlockscreen.nix
    ./dunst.nix
    ./feh.nix
    ./fonts.nix
    ./flameshot.nix
    ./gtk.nix
    ./picom.nix
    ./qt.nix
    ./rofi.nix
    ./xdg.nix
    ./zathura.nix
  ];

  programs = {
    mpv.enable = true;
  };

  home.packages = with pkgs; [

    unstable.nerdfetch
    libnotify
    xdg-utils
    xorg.xlsclients
    #WebCam
    gnome.cheese
    gparted
    xfce.xfce4-appfinder
    kolourpaint
  ];

}
