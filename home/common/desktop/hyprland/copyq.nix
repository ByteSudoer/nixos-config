{ pkgs, ... }:
{
  programs.copyq = {
    enable = true;
    package = pkgs.copyq;
    forceXWayland = true;
    systemdTarget = "graphical-session.target";
  };
}
