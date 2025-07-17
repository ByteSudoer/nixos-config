{ pkgs, ... }:
{

  programs = {
    virt-manager = {
      enable = true;
    };
  };
  virtualisation = {
    libvirtd = {
      enable = true;
      allowedBridges = [
        "virbr0"
        "virbr1"
        "br0"
      ];
      qemu = {
        vhostUserPackages = with pkgs; [ virtiofsd ];
        # Enable TPM emulation
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [ pkgs.OVMFFull.fd ];
        };

      };

      # hooks.qemu = {
      #   "bridge" = ./qemu-hook.sh;
      # };
    };

    # Enable USB redirection
    spiceUSBRedirection.enable = true;

    # libvirt = {
    #   enable = true;
    #   connections = {
    #     "qemu:///system" = {
    #       networks = [
    #         {
    #           definition = nixvirt.lib.network.writeXML {
    #             name = "nattttt";
    #             uuid = "67a06f76-9e6b-444e-9fb5-9b2591bedb94";
    #             forward = {
    #               mode = "nat";
    #             };
    #             bridge = {
    #               name = "virbr0";
    #               stp = "on";
    #               delay = "0";
    #             };
    #             mac = {
    #               address = "52:54:00:16:06:a1";
    #             };
    #             domain = {
    #               name = "network";
    #             };
    #             ip = {
    #               address = "192.168.13.1";
    #               netmask = "255.255.255.0";
    #               dhcp = {
    #                 range = {
    #                   start = "192.168.13.5";
    #                   end = "192.168.13.254";
    #                 };
    #               };
    #             };
    #           };
    #           active = false;
    #           restart = true;
    #         }
    #
    #       ];
    #
    #     };
    #   };
    #
    # };
  };
  # boot.kernel.sysctl = {
  #   "net.ipv4.conf.wlp0s20f3.proxy_arp" = 1;
  #   "net.ipv4.conf.virbr1.proxy_arp" = 1;
  #
  # };
  # environment.systemPackages = [
  #   pkgs.passt
  # ];
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
