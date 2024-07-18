{ lib, pkgs, config, modulesPath, platform, inputs, ... }:
{
  imports = [
    (import ./disks.nix { })
    (import ./battery.nix { inherit pkgs lib; })
    (import ./boot.nix { inherit pkgs; })
    (import ./hardware.nix { inherit lib config modulesPath inputs; })
    (import ./nvidia.nix { inherit lib; })
  ];

  nixpkgs.hostPlatform = lib.mkDefault "${platform}";
}
