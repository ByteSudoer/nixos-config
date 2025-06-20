{ pkgs, ... }:
{
  virtualisation = {
    libvirtd = {
      enable = true;
      allowedBridges = [
        "virbr0"
        "br0"
      ];
      qemu.vhostUserPackages = with pkgs; [ virtiofsd ];

      # hooks.qemu = {
      #   "qradar" = ./qemu-hook.sh;
      # };
    };
  };
  # environment.systemPackages = [
  #   pkgs.passt
  # ];
  programs.virt-manager.enable = true;
  # networking = {
  #   nat.enable = true;
  #   nat.externalInterface = "wlp0s20f3";
  #   nat.internalInterfaces = [ "virbr0" ];
  #   firewall.extraCommands = ''
  #     iptables -t nat -A PREROUTING -p tcp --dport 4443 -j DNAT --to-destination 192.168.122.100:443
  #
  #       iptables -t nat -A POSTROUTING -p tcp -d 192.168.122.100 --dport 443 -j MASQUERADE
  #   '';
  #
  # };
  # virtualisation.forwardPorts = [
  #   {
  #     from = "host";
  #     host.port = 32222;
  #     guest.port = 22;
  #   }
  # ];
  #
  # dconf.settings = {
  #   "org/virt-manager/virt-manager/connections" = {
  #     autoconnect = [ "qemu:///system" ];
  #     uris = [ "qemu:///system" ];
  #   };
  # };
}
