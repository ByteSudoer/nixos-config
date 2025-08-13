{ pkgs, ... }:
{
  services.xserver.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;

    extraPackages = with pkgs; [
      libappindicator
      libappindicator-gtk3
      libappindicator-gtk2
      libindicator
      libindicator-gtk3
      libindicator-gtk2
      lxappearance
      numlockx
      dmenu
      networkmanagerapplet
      volumeicon
    ];

  };
}
