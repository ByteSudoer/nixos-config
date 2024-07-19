{ config, ... }:
let
  msi_ec = config.boot.kernelPackages.callPackage ../../pkgs/msi-ec/default.nix { };
in
{
  boot = {

    # kernelPackages = pkgs.linuxPackages_latest;
    initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
    # initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
    # Whether to delete all files in /tmp during boot.
    tmp.cleanOnBoot = true;
  };
}
