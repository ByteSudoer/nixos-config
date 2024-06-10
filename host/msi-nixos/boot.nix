_: {
  boot = {

    # kernelPackages = pkgs.linuxPackages_latest;
    initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
    # initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };
}
