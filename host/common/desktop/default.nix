{ desktop, lib, ... }:
let
  isDesktop = builtins.isString desktop;
in
{
  imports = [
    (./. + "/${desktop}.nix")
    (./. + "/sddm.nix")
    (./. + "/thunar.nix")
    ../services/networkmanager.nix
    ../services/pipewire.nix
    ../hardware/bluetooth.nix
    ../virt
  ] ++ lib.optional isDesktop ./web-browsers;

  # Enable Plymouth and surpress some logs by default.
  # boot.plymouth.enable = true;
  # boot.kernelParams = [
  # The 'splash' arg is included by the plymouth option
  #   "quiet"
  #   "loglevel=3"
  #   "rd.udev.log_priority=3"
  #   "vt.global_cursor_default=0"
  # ];


  # Enable location services
  # location.provider = "geoclue2";

  programs = {

    dconf.enable = isDesktop;

    # Archive manager
    # file-roller.enable = true;
  };

}
