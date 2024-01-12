{ pkgs, ... }:
{
  xsession.windowManager.bspwm = {
    enable = true;
    package = pkgs.bspwm;
    extraConfigEarly = "
      $HOME/nixos-config/config/bspwm/autostart.sh &
    ";
    extraConfig = "
    bspc monitor eDP-1 I II III IV V VI VII VIII IX X
    bspc monitor HDMI-1 I II III IV V VI VII VIII IX X
    ";
  };
}
