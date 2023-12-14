{ pkgs, ... }: {
  imports = [
    # (./. + "/${desktop}")

    ./alacritty.nix
    ./betterlockscreen.nix
    ./firefox.nix
    ./fonts.nix
    ./gtk.nix
    ./picom.nix
    ./qt.nix
    ./rofi.nix
    ./thunar.nix
    ./xdg.nix
    ./zathura.nix
  ];

  programs = {
    mpv.enable = true;
    feh.enable = true;
  };

  home.packages = with pkgs; [

    libnotify
    pavucontrol
    xdg-utils
    xorg.xlsclients
  ];

}
