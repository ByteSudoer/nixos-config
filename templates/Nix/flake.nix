{
  description = "Nix Shell Nix dev and packaging";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          name = "Nix Dev & Packaging";
          packages = with pkgs; [
            nurl
            nixpkgs-review
            nix-index
            nix
            git
          ];
          shellHook = ''
            # Allow Unfree packages
            export NIXPKGS_ALLOW_UNFREE=1
          '';
        };
      }
    );
}
