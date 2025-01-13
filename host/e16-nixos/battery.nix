{ lib, ... }:
{
  ## KDE uses this service which conflicts with tlp
  services.power-profiles-daemon.enable = lib.mkForce false;

  services.tlp = {
    enable = lib.mkForce true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 70;

      #Optional helps save long term battery health
      START_CHARGE_THRESH_BAT0 = 70; # 70 and bellow it starts to charge
      STOP_CHARGE_THRESH_BAT0 = 90; # 90 and above it stops charging
      #Configure CPU “turbo boost”
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      RESTORE_THRESHOLDS_ON_BAT = 1;

      #Disable WIFI CARD when connected to LAN with a cable
      DEVICES_TO_DISABLE_ON_LAN_CONNECT = "wifi";
      # Disable  audio power saving mode
      # SOUND_POWER_SAVE_ON_AC = 0;
      # SOUND_POWER_SAVE_ON_BAT = 0;
      # SOUND_POWER_SAVE_CONTROLLER = "N";
      USB_EXCLUDE_AUDIO = 1;

      #Exclude Mouse &  Keyboad & headphones from autosuspend mode
      USB_DENYLIST = "4c4a:4155 248a:5b2f 145f:0323";
    };
  };

}
