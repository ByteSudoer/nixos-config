{ pkgs, lib, inputs, ... }: {
  # add more system settings here
  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    package = lib.mkForce pkgs.unstable.nix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];

      keep-outputs = true;
      keep-derivations = true;
      # warn-dirty = false;
      auto-optimise-store = true;
      builders-use-substitutes = true;
      trusted-users = [ "@wheel" ];
    };
  };
}
