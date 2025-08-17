_: {
  boot = {
    # kernel.sysctl = {
    #   "net.ipv4.ip_forward" = 1;
    # };

    #kernelPackages = pkgs.linuxPackages_6_9;
    initrd = {
      secrets = {
        "/root/crypthome.key" = "/root/crypthome.key";
      };
      availableKernelModules = [
        #eXtensible Host Controller Interface (xHCI) Host Controller Driver(usb 3.0 and 2.0)
        "xhci_pci"
        #"eXtensible Host Controller Interface (xHCI) Host Controller Driver(SATA and SSD)
        "ahci"
        #nvme module is a kernel driver in Linux that provides support for NVMe (Non-Volatile Memory Express)
        "nvme"
        #usbhid module stands for "USB Human Interface Device" (Eg Mouse,Keyboard)
        "usbhid"
        #USB mass storage devices(Large External hard drives)
        "usb_storage"
        #SCSI disk devices
        "sd_mod"
        #uas module stands for "USB Attached SCSI"
        "uas"
        #Thunderbolt interfaces
        "thunderbolt"
      ];
      kernelModules = [ "kvm-intel" ];
    };
    #Enable Nested virtualization
    extraModprobeConfig = ''
      options kvm_intel nested=1
    '';

    #kernelPackages = pkgs.linuxPackages_6_14;
    extraModulePackages = [ ];
    tmp = {
      # Whether to delete all files in /tmp during boot.
      cleanOnBoot = true;
      #Enable tmpfs for /tmp
      useTmpfs = true;
    };
  };
  system.activationScripts.createCryptKey = ''
    if [ ! -f /root/crypthome.key ];then
      dd if=/dev/urandom of=/root/crypthome.key bs=1024 count=ipv4
      chmod 400 /root/crypthome.key
    fi
  '';
}
