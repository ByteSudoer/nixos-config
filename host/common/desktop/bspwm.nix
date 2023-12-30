{ pkgs, ... }: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.xserver.displayManager.sddm.enable = true;
  services.xserver.windowManager.bspwm.enable = true;

  environment.systemPackages = with pkgs;[
    xarchiver
    xclip
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    lxappearance
  ];

}
