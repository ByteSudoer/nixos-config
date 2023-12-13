{ pkgs, desktop, ... }: {
  imports = [
    # (./. + "/${desktop}")

    ./alacritty.nix
    ./fonts.nix
    ./gtk.nix
    ./picom.nix
    ./qt.nix
    ./xdg.nix
    ./zathura.nix
  ];

  programs = {
    firefox.enable = true;
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
