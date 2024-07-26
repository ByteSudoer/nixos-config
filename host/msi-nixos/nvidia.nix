_: {
  # Nvidia
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {

    modesetting.enable = true;

    open = false;

    nvidiaSettings = true;
    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # powerManagement.enable = false;
    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    # powerManagement.finegrained = false;

    prime = {
      # sync.enable = true;
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
  # specialisation = {
  #   external-display.configuration = {
  #     system.nixos.tags = [ "external-display" ];
  #     hardware.nvidia = {
  #       prime.offload.enable = lib.mkForce false;
  #       powerManagement.enable = lib.mkForce false;
  #     };
  #   };
  # };
}
