{
  lib,
  modulesPath,
  platform,
  fs,
  ...
}:
{
  imports = [
    (import ./boot.nix { })
    (import ./hardware.nix { inherit lib modulesPath; })
    import
    ./disk-${fs}.nix
  ];

  nixpkgs.hostPlatform = lib.mkDefault "${platform}";
}
