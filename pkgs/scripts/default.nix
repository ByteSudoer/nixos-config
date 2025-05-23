{ pkgs, colorscheme, ... }:
{
  battery_info = pkgs.callPackage ./battery_info.nix { };
  defaultLayout = pkgs.callPackage ./defaultLayout.nix { };
  fehrandom = pkgs.callPackage ./fehrandom.nix { inherit colorscheme; };
  get_weather = pkgs.callPackage ./get_weather.nix { };
  lock = pkgs.callPackage ./lock.nix { };
  mediaplayer = pkgs.callPackage ./mediaplayer.nix { };
  pdf_merger = pkgs.callPackage ./pdf_merger.nix { };
  picom_toggle = pkgs.callPackage ./picom_toggle.nix { };
  rofi_window = pkgs.callPackage ./rofi_window.nix { };
  sp = pkgs.callPackage ./sp.nix { };
  swww_randomize = pkgs.callPackage ./swww_randomize.nix { };
  tmuxSession = pkgs.callPackage ./tmuxSession.nix { };
  wallpapers = pkgs.callPackage ./wallpapers.nix { };
}
