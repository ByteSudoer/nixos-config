{ pkgs, desktop, ... }: {
  imports = [
    (./. + "/${desktop}")


    ./alacritty.nix
  ];

  programs = {
    firefox.enable = true;
    mpv.enable = true;
    feh.enable = true;
  };

  home.packages = with pkgs; [
    libnotify
    obsidian
    pamixer
    pavucontrol
    xdg-utils
    xorg.xlsclients
    vscodium
  ];

  fonts.fontconfig.enable = true;
}
