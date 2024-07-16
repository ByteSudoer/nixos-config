{ lib, modulesPath, platform, ... }:
{
  imports = [
    (import ./boot.nix { })
    (import ./hardware.nix { inherit lib modulesPath; })
    (import ./disks.nix { })
  ];

  services.spice-vdagentd.enable = true;
  nixpkgs.hostPlatform = lib.mkDefault "${platform}";
}
