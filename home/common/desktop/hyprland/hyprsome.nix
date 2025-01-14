{ pkgs, ... }:
{
  programs.hyprsome = {
    enable = true;
    package = pkgs.hyprsome;
  };
}
