{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
  };
  # For Screen Sharing
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
  environment.systemPackages = with pkgs;[
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
  ];
}
