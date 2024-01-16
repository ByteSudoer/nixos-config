{ pkgs, ... }:
# Custom packages, that can be defined similarly to ones from nixpkgs
# Build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{
  # example = pkgs.callPackage ./example { };
  # permer = pkgs.callPackage ./permer { };

  # Scripts
  defaultLayout = pkgs.callPackage ./scripts/defaultLayout.nix { };
  fehrandom = pkgs.callPackage ./scripts/fehrandom.nix { };
  get_weather = pkgs.callPackage ./scripts/get_weather.nix { };
  lock = pkgs.callPackage ./scripts/lock.nix { };
  picom_toggle = pkgs.callPackage ./scripts/picom_toggle.nix { };
  sp = pkgs.callPackage ./scripts/sp.nix { };
  swww_randomize = pkgs.callPackage ./scripts/swww_randomize.nix { };
  tmuxSession = pkgs.callPackage ./scripts/tmuxSession.nix { };
  wallpapers = pkgs.callPackage ./scripts/wallpapers.nix { };

  # Utilities
  nerdfetch = pkgs.callPackage ./nerdfetch { };

  #Templates for dev environments
  templateInit = pkgs.callPackage ./templateInit { };

  # Spotifty
  spotify-ad = pkgs.callPackage ./spotify { };


} 
