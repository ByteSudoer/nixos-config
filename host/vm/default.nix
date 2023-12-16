{ lib, modulesPath, platform, ... }:
{
  imports = [
    (import ./boot.nix { })
    (import ./hardware.nix { inherit lib modulesPath; })
  ];

  services.spice-vdagentd.enable = true;
  nixpkgs.hostPlatform = lib.mkDefault "${platform}";
}
