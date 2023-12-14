{ pkgs, ... }:
# Custom packages, that can be defined similarly to ones from nixpkgs
# Build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{
  # example = pkgs.callPackage ./example { };
  # permer = pkgs.callPackage ./permer { };
  nerdfetch = pkgs.callPackage ./nerdfetch { };

  templateInit = pkgs.callPackage ./templateInit { };
  scripts = pkgs.callPackage ./scripts/default.nix { };


} 
