_: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.xserver.displayManager.sddm.enable = true;
  services.xserver.windowManager.bspwm.enable = true;

}
