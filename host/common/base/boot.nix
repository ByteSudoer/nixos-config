{ lib, hostname, ... }:
let
  bootConfig =
    if hostname == "t16-nixos" then
      {
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
    else if hostname == "vm" then
      {
        loader = {
          grub.enable = lib.mkForce true;
          grub.useOSProber = true;
          grub.efiSupport = true;
          grub.efiInstallAsRemovable = true;
        };

      }
    else
      {
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
