{ pkgs, hostname, ... }:

let
  card = if hostname == "msi-nixos" || "t16-nixos" then "wlo1" else "enp1s0";
  change-mac = pkgs.writeShellScript "change-mac" ''
    card=$1
    tmp=$(mktemp)
    ${pkgs.macchanger}/bin/macchanger "$card" -s | grep -oP "[a-zA-Z0-9]{2}:[a-zA-Z0-9]{2}:[^ ]*" > "$tmp"
    mac1=$(cat "$tmp" | head -n 1)
    mac2=$(cat "$tmp" | tail -n 1)
    if [ "$mac1" = "$mac2" ]; then
      if [ "$(cat /sys/class/net/"$card"/operstate)" = "up" ]; then
        ${pkgs.iproute2}/bin/ip link set "$card" down &&
        ${pkgs.macchanger}/bin/macchanger -r "$card"
        ${pkgs.iproute2}/bin/ip link set "$card" up
      else
        ${pkgs.macchanger}/bin/macchanger -r "$card"
      fi
    fi
  '';
in

{
  networking = {
    extraHosts = ''
      192.168.100.1 router
      192.168.12.10 controller
      192.168.122.10 ubuntu
    '';
    networkmanager = {
      enable = true;
      # wifi = {
      #   backend = "iwd";
      # };
    };
  };
  systemd.services.macchanger = {
    enable = true;
    description = "macchanger on ${card}";
    wants = [ "network-pre.target" ];
    before = [ "network-pre.target" ];
    bindsTo = [ "sys-subsystem-net-devices-${card}.device" ];
    after = [ "sys-subsystem-net-devices-${card}.device" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${change-mac} ${card}";
    };
  };

  # Workaround https://github.com/NixOS/nixpkgs/issues/180175
  # systemd.services.NetworkManager-wait-online.enable = false;
}
