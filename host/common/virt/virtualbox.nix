{
  pkgs,
  extra,
  lib,
  ...
}:
{
  virtualisation.virtualbox = {
    host.enable = lib.isString extra;
    host.package = pkgs.vmware-workstation;
    host.enableKvm = true;
  };

}
