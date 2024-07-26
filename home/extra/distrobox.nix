{ pkgs, ... }:
{
  home.packages = with pkgs.unstable; [ distrobox ];
}
