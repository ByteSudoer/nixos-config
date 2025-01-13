{ pkgs, lib, ... }:
{
  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    audio.enable = true;
    socketActivation = true;
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    wireplumber = {
      enable = true;
      extraConfig = {
        "99-disable-suspend" = {
          "monitor.alsa.rules" = [
            {
              matches = [
                {
                  "node.name" = "~alsa_output.*";
                }
              ];
              actions = {
                update-props = {
                  "session.suspend-timeout-seconds" = 0;
                };

              };

            }
          ];

        };
      };
    };
  };

  #sound.enable = true;

  hardware = {
    pulseaudio.enable = lib.mkForce false;
  };

  # Start WirePlumber (with PipeWire) at boot.
  systemd.user.services.wireplumber.wantedBy = [ "default.target" ];

  environment.systemPackages = with pkgs; [
    pavucontrol
    alsa-utils
  ];
}
