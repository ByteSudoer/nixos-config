_: {
  boot = {
    # Bootloader.
    loader.grub.enable = true;
    loader.grub.device = "/dev/vda";
    loader.grub.useOSProber = true;
    initrd = {
      availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };
}
