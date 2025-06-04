{ pkgs, ... }:
{
  services.betterlockscreen = {
    enable = false;
    package = pkgs.betterlockscreen;
    inactiveInterval = 10;
  };
}
