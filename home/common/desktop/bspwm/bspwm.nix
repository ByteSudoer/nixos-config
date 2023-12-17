{ pkgs, ... }:
{
  xsession.windowManager.bspwm = {
    enable = true;
    package = pkgs.bspwm;
  };
}
