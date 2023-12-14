{ desktop, ... }: {
  imports = [
    (./. + "/${desktop}.nix")
    (./. + "/sddm.nix")
    (./. + "/thunar.nix")
    ../services/networkmanager.nix
    ../services/pipewire.nix
    ../virt
  ];

  services.xserver.layout = "fr";

  # Enable Plymouth and surpress some logs by default.
  # boot.plymouth.enable = true;
  # boot.kernelParams = [
  # The 'splash' arg is included by the plymouth option
  #   "quiet"
  #   "loglevel=3"
  #   "rd.udev.log_priority=3"
  #   "vt.global_cursor_default=0"
  # ];

  hardware.opengl.enable = true;

  # Enable location services
  # location.provider = "geoclue2";

  programs = {

    dconf.enable = true;

    # Archive manager
    # file-roller.enable = true;
  };

}
