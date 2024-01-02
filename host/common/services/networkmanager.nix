_:
{
  networking = {
    extraHosts = ''
      192.168.100.1 router
      192.168.12.10 controller
    '';
    networkmanager = {
      enable = true;
      # wifi = {
      #   backend = "iwd";
      # };
    };
  };

  # Workaround https://github.com/NixOS/nixpkgs/issues/180175
  # systemd.services.NetworkManager-wait-online.enable = false;
}
