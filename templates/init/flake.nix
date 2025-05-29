{
  description = "Nix Shell for DevOps";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          name = "devops";
          packages = with pkgs; [
            curl
            jq
          ];
          shellHook = ''
            export NIXPKGS_ALLOW_UNFREE=1
          '';
        };
      }
    );
}
