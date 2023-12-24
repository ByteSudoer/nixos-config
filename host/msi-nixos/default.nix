{ lib, config, modulesPath, platform, ... }:
{
  imports = [
    (import ./boot.nix { })
    (import ./hardware.nix { inherit lib config modulesPath; })
    (import ./nvidia.nix { inherit lib; })
  ];

  nixpkgs.hostPlatform = lib.mkDefault "${platform}";
}
