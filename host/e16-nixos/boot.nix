{ pkgs, ... }:
{
  boot = {

    kernelPackages = pkgs.linuxPackages_6_9;
    initrd = {
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
    kernelParams = [
      # Force use of the thinkpad_acpi driver for backlight control.
      # This allows the backlight save/load systemd service to work.
      "acpi_backlight=native"
      #Audio
      # "snd_hda_intel.dmic_detect=0"
      # "snd-intel-dspcfg.dsp_driver=1"
    ];
    #Enable Nested virtualization
    extraModprobeConfig = "options kvm_intel nested=1";
    extraModulePackages = [ ];
    # Whether to delete all files in /tmp during boot.
    tmp.cleanOnBoot = true;
  };
}
