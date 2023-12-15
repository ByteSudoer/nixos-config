{ pkgs, lib, ... }: {
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  hardware = {
    pulseaudio.enable = lib.mkForce false;
  };

  environment.systemPackages = with pkgs; [
    pavucontrol
    alsa-utils
  ];
}
