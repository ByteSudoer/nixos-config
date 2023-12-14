{ pkgs, ... }: {
  imports = [
    # (./. + "/${desktop}")

    ./alacritty.nix
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
    
    libnotify
    pavucontrol
    xdg-utils
    xorg.xlsclients
  ];

}
