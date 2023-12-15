{ lib, platform, ... }:
{
  imports = [
    ../common/services/pipewire.nix
  ];
  nixpkgs.hostPlatform = lib.mkDefault "${platform}";
}
