{ pkgs, ... }: {
  home.packages = with pkgs; [
    ventoy
    usbimager
    rpi-imager
  ];
}
