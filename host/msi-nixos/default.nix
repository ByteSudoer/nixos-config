{ lib, config, modulesPath, platform, ... }:
{
  imports = [
    (import ./boot.nix { })
    (import ./hardware.nix { inherit lib config modulesPath; })
  ];

  nixpkgs.hostPlatform = lib.mkDefault "${platform}";
}
