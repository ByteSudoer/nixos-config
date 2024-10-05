_: {
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
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
