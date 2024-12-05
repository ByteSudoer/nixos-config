{
  config,
  lib,
  modulesPath,
  inputs,
  pkgs,
  ...
}:

{

  imports = [
    # acpi_call makes tlp work for newer thinkpads
    inputs.nixos-hardware.nixosModules.common-pc-laptop-ssd
    inputs.nixos-hardware.nixosModules.common-gpu-intel
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  networking.useDHCP = lib.mkDefault true;

  # powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
  hardware = {
    enableRedistributableFirmware = true;
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    trackpoint = {
      enable = lib.mkDefault true;
      emulateWheel = lib.mkDefault config.hardware.trackpoint.enable;
    };
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages32 = with pkgs.pkgsi686Linux; [ intel-vaapi-driver ];

    };
    intel-gpu-tools.enable = true;
  };

  #Enable firmware update service
  services.fwupd.enable = lib.mkDefault true;

}
