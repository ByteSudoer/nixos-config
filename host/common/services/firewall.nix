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
      "192.168.100.110" = [ "proxmox" ];
    };
    firewall = {
      enable = true;
      logRefusedConnections = true;
      allowedTCPPorts = lib.optionals portForward [ 32222 ];
      allowedTCPPortRanges = lib.optionals (isInList hostname hostnames) [
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = lib.optionals (isInList hostname hostnames) [
        {
          from = 1714;
          to = 1764;
        }
      ];
    };
    nat = {
      enable = isInList hostname hostnames;
      internalInterfaces = [
        "enp0s31f6"
        "wlp0s20f3"
      ];
      externalInterface = "virbr0";
      forwardPorts = lib.optionals portForward [
        {

          sourcePort = 32222;
          proto = "tcp";
          destination = "192.168.122.25:22";

        }
      ];
    };

  };
}
