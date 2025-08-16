{ pkgs, ... }:
{

  xsession.windowManager.awesome = {
    enable = true;
    package = pkgs.unstable.awesome;

    luaModules = with pkgs.luaPackages; [
      luarocks
      vicious
      awesome-wm-widgets
      lgi
    ];

  };

  # xdg.configFile.awesome = {
  #   source = ../../../../config/awesome;
  #   recursive = true;
  # };
}
