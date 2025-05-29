{
  pkgs,
  extra,
  lib,
  ...
}:
{
  virtualisation.vmware = {
    host.enable = !lib.isString extra;
    host.package = pkgs.vmware-workstation;
  };

  environment.systemPackages = with pkgs; [ linux-wifi-hotspot ];

}
