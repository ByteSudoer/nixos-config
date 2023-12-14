{
  description = "Nix Shell for C development";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs
    , flake-utils
    , ...
    }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs;[
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
