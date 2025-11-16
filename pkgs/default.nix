{ pkgs, colorscheme, ... }:
# Custom packages, that can be defined similarly to ones from nixpkgs
# Build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{
  # example = pkgs.callPackage ./example { };
  # permer = pkgs.callPackage ./permer { };

  # Scripts
  battery_info = pkgs.callPackage ./scripts/battery_info.nix { };
  defaultLayout = pkgs.callPackage ./scripts/defaultLayout.nix { };
  fehrandom = pkgs.callPackage ./scripts/fehrandom.nix { inherit colorscheme; };
  get_weather = pkgs.callPackage ./scripts/get_weather.nix { };
  gh-graph = pkgs.callPackage ./gh-graph { };
  lock = pkgs.callPackage ./scripts/lock.nix { };
  mediaplayer = pkgs.callPackage ./scripts/mediaplayer.nix { };
  # m-control-center = pkgs.callPackage ./MControlerCenter { };
  picom_toggle = pkgs.callPackage ./scripts/picom_toggle.nix { };
  pdf_merger = pkgs.callPackage ./scripts/pdf_merger.nix { };
  rofi_window = pkgs.callPackage ./scripts/rofi_window.nix { };
  sp = pkgs.callPackage ./scripts/sp.nix { };
  swww_randomize = pkgs.callPackage ./scripts/swww_randomize.nix { };
  tmuxSession = pkgs.callPackage ./scripts/tmuxSession.nix { };
  # tlp-ui = pkgs.callPackage ./tlp-ui { };
  wallpapers = pkgs.callPackage ./scripts/wallpapers.nix { };
  waydroid_session = pkgs.callPackage ./scripts/waydroid-session.nix { };

  # Utilities
  # nerdfetch = pkgs.callPackage ./nerdfetch { };

  #Templates for dev environments
  templateInit = pkgs.callPackage ./templateInit { };

  # Spotifty
  spotify-ad = pkgs.callPackage ./spotify { };

}
