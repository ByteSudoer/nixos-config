{ lib, modulesPath, platform, ... }:
{
  imports = [
    (import ./boot.nix { })
    (import ./hardware.nix { inherit lib modulesPath; })
  ];

  nixpkgs.hostPlatform = lib.mkDefault "${platform}";
}
