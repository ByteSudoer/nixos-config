{ pkgs, desktop, ... }: {
  imports = [
    (./. + "/${desktop}")

    ./alacritty.nix
    ./betterlockscreen.nix
    ./firefox.nix
    ./fonts.nix
    ./gtk.nix
    ./picom.nix
    ./qt.nix
    ./rofi.nix
    ./xdg.nix
    ./zathura.nix
  ];

  programs = {
    mpv.enable = true;
    feh.enable = true;
  };

  home.packages = with pkgs; [

    nerdfetch
    libnotify
    xdg-utils
    xorg.xlsclients
    #Screenshot
    flameshot
    #WebCam
    gnome.cheese
    gparted
    xfce.xfce4-appfinder
    kolourpaint
  ];

}
