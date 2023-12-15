{ lib, ... }: {


  # Bootloader.
  boot.loader.grub.enable = lib.mkForce true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

}
