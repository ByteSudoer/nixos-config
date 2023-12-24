_: {


  # Bootloader.
  # boot.loader.grub.enable = lib.mkForce true;
  # boot.loader.grub.device = "nodev";
  # boot.loader.grub.useOSProber = true;

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot"; # ← use the same mount point here.
    };
    grub = {
      efiSupport = true;
      #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
      device = "nodev";
    };
  };

}
