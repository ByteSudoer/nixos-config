{ pkgs, desktop, lib, ... }: {
  virtualisation.vmware.host.enable = lib.isString desktop;

  environment.systemPackages = with pkgs;[
    linux-wifi-hotspot
  ];

}
