{
  description = "Nix Shell for C development";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.05";
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
          name = "C-dev shell";
          packages = with pkgs; [
            binutils
            cmake
            glibc
            openssl
            pkg-config
            stdenv

            gcc
            gdb
            gnumake
          ];
        };
      }
    );
}
