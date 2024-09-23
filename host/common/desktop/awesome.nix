{ pkgs, ... }:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # services.displayManager.sddm.enable = true;
  services.xserver.windowManager.awesome = {
    enable = true;
    luaModules = with pkgs.luaPackages; [ luarocks ];
  };

  environment.systemPackages = with pkgs; [
    pulseaudio
    xarchiver
    xclip
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    lxappearance
  ];

}
