{ pkgs, lib, inputs, ... }: {
  # add more system settings here
  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    package = lib.mkForce pkgs.unstable.nix;
    settings = {

      keep-outputs = true;
      keep-derivations = true;
      # warn-dirty = false;
      auto-optimise-store = true;
      builders-use-substitutes = true;
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "@wheel" ];
    };
  };
}
