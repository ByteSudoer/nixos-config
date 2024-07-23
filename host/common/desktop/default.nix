{ desktop, hostname, lib, ... }:
let
  isDesktop = builtins.isString desktop;
  isVM = element: list: builtins.elem element list;
  vms = [
    "vm"
    "vm-mini"
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
  ] ++ lib.optionals (isVM hostname vms) ../hardware/bluetooth.nix;


  programs = {
    dconf.enable = isDesktop;
  };

}
