{ lib, hostname, ... }:
let
  bootConfig =
    if hostname == "msi-nixos" || "vm" then {
      loader = {
        efi = {
          canTouchEfiVariables = lib.mkForce true;
          efiSysMountPoint = "/boot"; # ← use the same mount point here.
        };
        grub = {
          efiSupport = true;
          #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
          device = "nodev";
        };
      };

    }
    else {
      loader = {
        grub.enable = lib.mkForce true;
        grub.device = "/dev/vda";
        grub.useOSProber = true;
      };

    };
in
{
  boot = bootConfig;
}
