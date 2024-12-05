{ pkgs, ... }:
{

  # Fingerprint reader: login and unlock with fingerprint (if you add one with `fprintd-enroll`)
  services = {
    fprintd = {
      enable = false;
      package = pkgs.fprintd-tod;
      tod.enable = true;
      # tod.driver = pkgs.libfprint-2-tod1-goodix; # Goodix driver module
      # tod.driver = pkgs.libfprint-2-tod1-vfs0090; # driver for 2016 ThinkPads
      tod.driver = pkgs.libfprint-2-tod1-goodix-550a; # Goodix 550a driver (from Lenovo)
    };
  };
  # Start the service at boot
  systemd.services.fprintd = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig.Type = "simple";
  };
}
