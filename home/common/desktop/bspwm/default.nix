{ pkgs, ... }:
{
  imports = [
    ./bspwm.nix
    { inherit pkgs; }
    ./sxhkd.nix
    { inherit pkgs; }
  ];
}
