{ pkgs, ... }:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # services.displayManager.sddm.enable = true;
  services.xserver.windowManager.awesome = {
    enable = true;
    luaModules = with pkgs.luaPackages; [
      luarocks
      vicious
      awesome-wm-widgets
      lgi
    ];
  };

  environment.systemPackages = with pkgs; [
    xarchiver
    kdePackages.ark
    xclip
    lxappearance
    snixembed
    volumeicon
    xfce.xfce4-appfinder
    xfce.xfce4-power-manager
  ];

}
