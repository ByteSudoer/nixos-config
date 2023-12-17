{ pkgs, ... }: {
  home.packages = with pkgs; [
    ventoy
    rpi-imager
  ];
}
