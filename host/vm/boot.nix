{ pkgs, ... }:
{

  boot = {
    kernelPackages = pkgs.linuxPackages_6_9;
    initrd.availableKernelModules = [
      "xhci_pci"
      "ohci_pci"
      "ehci_pci"
      "virtio_pci"
      "ahci"
      "usbhid"
      "sr_mod"
      "virtio_blk"
    ];
    initrd.kernelModules = [ "kvm-intel" ];
    kernelModules = [ ];
    extraModulePackages = [ ];

  };

}
