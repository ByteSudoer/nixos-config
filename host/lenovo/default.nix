{
  config,
  lib,
  modulesPath,
  platform,
  ...
}:
{
  imports = [
    (import ./boot.nix { })
    (import ./hardware.nix { inherit config lib modulesPath; })
  ];

  nixpkgs.hostPlatform = lib.mkDefault "${platform}";
}
