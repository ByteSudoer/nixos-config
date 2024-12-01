_: {
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "Nordic";
  };

  # home = {
  #   packages = with pkgs; [
  #     theme.qtTheme.package
  #     libsForQt5.qtstyleplugin-kvantum
  #   ];
  #   sessionVariables = {
  #     "QT_STYLE_OVERRIDE" = "kvantum";
  #   };
  # };

  # xdg.configFile = {
  #   "Kvantum/kvantum.kvconfig".text = ''
  #     [General]
  #     theme=${theme.qtTheme.name}
  #   '';
  # };
}
