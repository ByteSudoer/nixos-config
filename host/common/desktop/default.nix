{ desktop, ... }:
let
  isDesktop = builtins.isString desktop;
in
{
  imports = [
    (./. + "/${desktop}.nix")
    (./. + "/sddm.nix")
    (./. + "/thunar.nix")
    ../services/networkmanager.nix
    ../services/pipewire.nix
    ../hardware/bluetooth.nix
    ../virt
    ./web-browsers
  ];

  programs = {

    dconf.enable = isDesktop;
  };

}
