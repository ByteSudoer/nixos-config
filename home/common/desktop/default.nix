{ pkgs, desktop, ... }: {
  imports = [
    # (./. + "/${desktop}")

    ./alacritty.nix
    ./gtk.nix
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
    catppuccin-gtk
    libnotify
    pavucontrol
    xdg-utils
    xorg.xlsclients
  ];

  fonts.fontconfig.enable = true;
}
