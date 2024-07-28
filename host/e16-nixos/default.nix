{ lib
, pkgs
, config
, modulesPath
, platform
, inputs
, ...
}:
{
  imports = [
    (import ./battery.nix { inherit lib; })
    (import ./disks.nix { inherit pkgs; })
    (import ./boot.nix { inherit pkgs config; })
    (import ./hardware.nix {
      inherit
        lib
        config
        modulesPath
        inputs
        pkgs
        ;
    })
  ];

  nixpkgs.hostPlatform = lib.mkDefault "${platform}";
}
