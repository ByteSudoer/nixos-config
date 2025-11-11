{
  extra,
  lib,
  ...
}:
{
  virtualisation.waydroid.enable = lib.isString extra;
}
