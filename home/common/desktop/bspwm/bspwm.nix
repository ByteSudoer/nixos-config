{ pkgs, ... }:
{
  xsession.windowManager.bspwm = {
    enable = true;
    package = pkgs.bspwm;
    extraConfigEarly = "
      $HOME/nixos-config/config/bspwm/autostart.sh &
    ";
    extraConfig = "
    ";
  };
}
