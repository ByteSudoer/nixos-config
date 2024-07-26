{ lib, pkgs, config, modulesPath, platform, inputs, ... }:
{
  imports = [
    (import ./disks.nix { inherit pkgs; })
    (import ./boot.nix { inherit pkgs config; })
    (import ./hardware.nix { inherit lib config modulesPath inputs; })
  ];

  nixpkgs.hostPlatform = lib.mkDefault "${platform}";
}
