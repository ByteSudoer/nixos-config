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
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
    ];
  };
  environment.systemPackages = with pkgs;[
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5ct
    libsForQt5.polkit-kde-agent
    lxqt.lxqt-policykit
  ];

  ## Needed fot swaylock
  security.pam.services.swaylock = { };

}
