{ pkgs, ... }:
{
  imports = [
    ./bspwm.nix
    ./polybar.nix
    ./sxhkd.nix
  ];
  home.packages = with pkgs;[
    volumeicon
    networkmanagerapplet
    numlockx

  ];
}
