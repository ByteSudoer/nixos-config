{ pkgs, lib, ... }:
{
  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    audio.enable = true;
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
  };
  #sound.enable = true;

  hardware = {
    pulseaudio.enable = lib.mkForce false;
  };

  environment.systemPackages = with pkgs; [
    pavucontrol
    alsa-utils
  ];
}
