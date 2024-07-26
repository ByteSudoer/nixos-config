_:
{
  boot = {

    # kernelPackages = pkgs.linuxPackages_latest;
    initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
    # initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-intel" ];
    kernelParams = [
      # Force use of the thinkpad_acpi driver for backlight control.
      # This allows the backlight save/load systemd service to work.
      "acpi_backlight=native"
    ];
    #Enable Nested virtualization
    extraModprobeConfig = "options kvm_intel nested=1";
    extraModulePackages = [ ];
    # Whether to delete all files in /tmp during boot.
    tmp.cleanOnBoot = true;
  };
}
