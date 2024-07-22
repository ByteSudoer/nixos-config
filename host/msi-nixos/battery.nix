{ lib, ... }:
{
  ## KDE uses this service which conflicts with tlp
  services.power-profiles-daemon.enable = lib.mkForce false;
  # environment.systemPackages = with pkgs; [
  #   auto-cpufreq
  #   getent
  # ];
  # services.auto-cpufreq.enable = true;
  #
  # # optionally, you can configure your auto-cpufreq settings, if you have any
  # services.auto-cpufreq.settings = {
  #   charger = {
  #     governor = "performance";
  #     turbo = "auto";
  #   };
  #   battery = {
  #     governor = "powersave";
  #     turbo = "auto";
  #     enable_thresholds = true;
  #     start_threshold = 20;
  #     stop_threshold = 80;
  #   };
  # };

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
      CPU_MAX_PERF_ON_BAT = 60;

      #Optional helps save long term battery health
      START_CHARGE_THRESH_BAT1 = 40; # 40 and bellow it starts to charge
      STOP_CHARGE_THRESH_BAT1 = 80; # 80 and above it stops charging
      RESTORE_THRESHOLDS_ON_BAT = 1;

      #Disable WIFI CARD when connected to LAN with a cable
      DEVICES_TO_DISABLE_ON_LAN_CONNECT = "wifi";

    };
  };

}
