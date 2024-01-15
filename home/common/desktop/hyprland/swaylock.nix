{ pkgs, ... }:
{
  security.pam.services.swaylock = { };
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock;
  };
}
