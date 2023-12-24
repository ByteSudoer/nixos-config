{ pkgs, ... }: {
  virtualisation.vmware.host.enable = true;

  environment.systemPackages = with pkgs;[
    linux-wifi-hotspot
  ];

}
