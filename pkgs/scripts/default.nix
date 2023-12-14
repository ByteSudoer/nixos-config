{ pkgs, ... }:
{
  defaultLayout = pkgs.callPackage ./defaultLayout.nix { };
  fehrandom = pkgs.callPackage ./fehrandom.nix { };
  lock = pkgs.callPackage ./lock.nix { };
  picom_toggle = pkgs.callPackage ./picom_toggle.nix { };
  sp = pkgs.callPackage ./sp.nix { };
  tmuxSession = pkgs.callPackage ./tmuxSession.nix { };
  wallpapers = pkgs.callPackage ./wallpapers.nix { };
}
