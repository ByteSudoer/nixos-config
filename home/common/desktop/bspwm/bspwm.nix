{ pkgs, ... }:
{
  xsession.windowManager.bspwm = {
    enable = true;
    package = pkgs.bspwm;
    extraConfigEarly = "\n      $HOME/nixos-config/config/bspwm/autostart.sh &\n    ";
    extraConfig = "\n    ";
  };
}
