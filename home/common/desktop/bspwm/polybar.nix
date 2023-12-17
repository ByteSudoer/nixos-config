{ pkgs, ... }:
{
  services.polybar = {
    enable = true;
    package = pkgs.polybar;
  };
}
