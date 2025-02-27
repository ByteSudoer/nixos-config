{ lib, hostname, ... }:
let
  isInList = element: list: builtins.elem element list;
  hostnames = [
    "vm"
    "vm-mini"
  ];
  portForward = true;
in
{

  networking = {
    hosts = {
      "192.168.100.1" = [ "router" ];
      "192.168.100.29" = [ "pi" ];
      "192.168.100.110" = [ "proxmox" ];
    };
    # nftables = {
    #   enable = true;
    #   ruleset = ''
    #     table ip nat {
    #       chain PREROUTING {
    #         type nat hook prerouting priority dstnat; policy accept;
    #         iifname "wlp0s20f3" tcp dport 44333 dnat to 192.168.122.100:443
    #       }
    #     }
    #   '';
    # };
    firewall = {
      # enable = !isInList hostname hostnames;
      enable = true;
      # allowedTCPPorts = [ 44333 ] ++ lib.optionals (portForward == true) [ 44333 ];
      allowedTCPPorts = [ 44333 ];
    };

    nat = {
      enable = true;
      internalInterfaces = [
        "wlp0s20f3"
      ];
      externalInterface = "virbr0";
      forwardPorts = [
        {
          sourcePort = 44333;
          proto = "tcp";
          destination = "192.168.122.100:443";
        }
      ];
    };

  };
}
