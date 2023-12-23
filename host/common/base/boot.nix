{ lib, ... }: {


  # Bootloader.
  boot.loader.grub.enable = lib.mkForce true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;

}
