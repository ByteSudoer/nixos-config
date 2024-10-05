{ lib, hostname, ... }:
let
  isInList = element: list: builtins.elem element list;
  hostnames = [
    "vm"
    "vm-mini"
  ];
  portForward = false;
in
{

  networking = {
    hosts = {
      "192.168.100.1" = [ "router" ];
      "192.168.100.29" = [ "pi" ];
    };
    firewall = {
      enable = isInList hostname hostnames;
      allowedTCPPorts = [ ] ++ lib.optionals (portForward == true) [ 32222 ];

    };

  };
}
