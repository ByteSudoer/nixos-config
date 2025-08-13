{ pkgs, desktop, ... }:
{
  imports = [
    (./. + "/${desktop}")

    ./alacritty.nix
    ./betterlockscreen.nix
    # ./catppuccin.nix
    ./dunst.nix
    ./feh.nix
    ./fonts.nix
    ./flameshot.nix
    ./ghostty.nix
    ./gtk.nix
    ./picom.nix
    ./qt.nix
    ./rofi.nix
    ./volumeicon.nix
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
    cheese
    gparted
    xfce.xfce4-appfinder
    kdePackages.kolourpaint
  ];

}
