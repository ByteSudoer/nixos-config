{ pkgs, ... }:
{
  xsession.windowManaer.bspwm = {
    enable = true;
    package = pkgs.bspwm;
  };
}
