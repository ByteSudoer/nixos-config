{ pkgs, ... }:
{
  services.xserver.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;

    extraPackages = with pkgs; [
      numlockx
      dmenu
      networkmanagerapplet
      volumeicon
    ];

  };
}
