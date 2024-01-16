{ pkgs, ... }:
{
  defaultLayout = pkgs.callPackage ./defaultLayout.nix { };
  fehrandom = pkgs.callPackage ./fehrandom.nix { };
  get_weather = pkgs.callPackage ./get_weather.nix { };
  lock = pkgs.callPackage ./lock.nix { };
  picom_toggle = pkgs.callPackage ./picom_toggle.nix { };
  sp = pkgs.callPackage ./sp.nix { };
  swww_randomize = pkgs.callPackage ./swww_randomize.nix { };
  tmuxSession = pkgs.callPackage ./tmuxSession.nix { };
  wallpapers = pkgs.callPackage ./wallpapers.nix { };
}
