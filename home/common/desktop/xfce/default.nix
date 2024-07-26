_: {

  # home.packages = with pkgs;[
  #   xfce.xfce4-whiskermenu-plugin
  #   xfce.xfce4-weather-plugin
  #   xfce.xfce4-volumed-pulse
  #   xfce.xfce4-systemload-plugin
  #   xfce.xfce4-settings
  #   xfce.xfce4-session
  #   xfce.xfce4-pulseaudio-plugin
  #   xfce.xfce4-power-manager
  #   xfce.xfce4-panel-profiles
  #   xfce.xfce4-panel
  #   xfce.xfce4-netload-plugin
  #   xfce.xfce4-datetime-plugin
  #   xfce.xfce4-battery-plugin
  #   xorg.xdpyinfo
  #   xarchiver
  #   xclip
  #
  #   libsForQt5.qt5.qtquickcontrols2
  #   libsForQt5.qt5.qtgraphicaleffects
  #   lxappearance
  # ];

  xdg.configFile.xfce4 = {
    source = ../../../../config/xfce4;
    recursive = true;
  };
}
