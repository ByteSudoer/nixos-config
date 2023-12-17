{ pkgs, ... }:
{
  services.sxhkd = {
    enable = true;
    package = pkgs.sxhkd;
    sxhkd.keybindings = {
      "F12" = "lock";
      "super + return" = "alacritty";
      "super+ w" = "firefox";
    };
  };
}
