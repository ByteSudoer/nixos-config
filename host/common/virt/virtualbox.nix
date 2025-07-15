{
  pkgs,
  extra,
  lib,
  ...
}:
{
  virtualisation.virtualbox = {
    host.enable = lib.isString extra;
    host.package = pkgs.virtualbox;
    # host.enableKvm = true;
  };

}
