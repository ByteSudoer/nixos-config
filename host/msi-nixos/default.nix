{ lib, pkgs, config, modulesPath, platform, ... }:
{
  imports = [
    (import ./disks.nix { })
    (import ./battery.nix { inherit pkgs lib; })
    (import ./boot.nix { inherit pkgs; })
    (import ./hardware.nix { inherit lib config modulesPath; })
    (import ./nvidia.nix { inherit lib; })
  ];

  nixpkgs.hostPlatform = lib.mkDefault "${platform}";
}
