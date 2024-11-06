{
  pkgs,
  lib,
  modulesPath,
  platform,
  ...
}:
{
  imports = [
    (import ./boot.nix { inherit pkgs; })
    (import ./hardware.nix { inherit lib modulesPath; })
    (import ./disks.nix { })
  ];

  services.spice-vdagentd.enable = true;
  services.qemuGuest.enable = true;
  nixpkgs.hostPlatform = lib.mkDefault "${platform}";
}
