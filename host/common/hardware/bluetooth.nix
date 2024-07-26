{ pkgs, ... }:
{
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        KernelExperimental = true;
      };
    };
  };
  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [ blueberry ];
}
