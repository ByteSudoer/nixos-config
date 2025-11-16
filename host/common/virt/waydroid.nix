{
  extra,
  lib,
  pkgs,
  ...
}:
{
  virtualisation.waydroid.enable = lib.isString extra;
  environment.systemPackages = with pkgs; [
    wl-clipboard
    waydroid_session
  ];

}
