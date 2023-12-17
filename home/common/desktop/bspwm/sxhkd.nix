{ pkgs, ... }:
{
  services.sxhkd = {
    enable = true;
    package = pkgs.sxhkd;
    keybindings = {
      # Lock Screen
      "F12" = "lock";
      # Terminal and Web-Browser
      "super + Return" = "alacritty";
      "super + w" = "firefox";
      #File Manager
      "super + shift + Return" = "thunar";
      # Quit/Restart bspwm
      "super + shift + {r,c}" = "bspc {quit,wm -r}";
    };
  };
}
