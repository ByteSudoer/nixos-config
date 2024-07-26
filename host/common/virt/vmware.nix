{
  pkgs,
  extra,
  lib,
  ...
}:
{
  virtualisation.vmware.host.enable = lib.isString extra;

  environment.systemPackages = with pkgs; [ linux-wifi-hotspot ];

}
