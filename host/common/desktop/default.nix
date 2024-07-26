{
  desktop,
  hostname,
  lib,
  ...
}:
let
  isDesktop = builtins.isString desktop;
  isNotVM = element: list: builtins.elem element list;
  workstations = [
    "msi-nixos"
    "t16-nixos"
    "lenovo"
  ];
in
{
  imports = [
    (./. + "/${desktop}.nix")
    (./. + "/sddm.nix")
    (./. + "/thunar.nix")
    ../services/networkmanager.nix
    ../services/pipewire.nix
    ../virt
    ./web-browsers
  ] ++ lib.optional (isNotVM hostname workstations) ../hardware/bluetooth.nix;

  programs = {
    dconf.enable = isDesktop;
  };

}
