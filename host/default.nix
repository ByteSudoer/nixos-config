{
  config,
  desktop,
  hostname,
  inputs,
  lib,
  modulesPath,
  outputs,
  stateVersion,
  pkgs,
  platform,
  username,
  ...
}:
{
  imports =
    [
      inputs.disko.nixosModules.disko

      (modulesPath + "/installer/scan/not-detected.nix")
      ./${hostname}
      ./common/base
      ./common/users
    ]
    ++ lib.optional (builtins.pathExists (./. + "/${hostname}/extra.nix")) ./${hostname}/extra.nix
    # Include desktop config if a desktop is defined
    ++ lib.optional (builtins.isString desktop) ./common/desktop;

  nixpkgs = {

    config = {

      # permittedInsecurePackages = [
      #   "electron-19.1.9"
      #   "electron-25.9.0"
      # ];

      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default
      # inputs.embr.overlay
      # inputs.agenix.overlays.default

      # Or just specify overlays directly here, for example:
      # (_: _: { embr = inputs.embr.packages."${pkgs.system}".embr; })
    ];

  };

  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 21d";
    };

    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    optimise.automatic = true;
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://hyprland.cachix.org"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      trusted-users = [
        "root"
        "${username}"
      ];
    };
  };

  system = {
    inherit stateVersion;
    activationScripts.diff = {
      supportsDryActivation = true;
      text = ''
        ${pkgs.nvd}/bin/nvd --nix-bin-dir=${pkgs.nix}/bin diff /run/current-system "$systemConfig"
      '';
    };
  };
  nixpkgs.hostPlatform = lib.mkDefault "${platform}";

}
