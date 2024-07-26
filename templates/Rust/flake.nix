{
  description = "Nix Shell with Rust tools";
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
          packages = with pkgs; [
            # Rust Code Runner
            bacon

            rustc
            cargo
            rustfmt
            rust-analyzer
            clippy

            ##Needed for the openssl crate
            pkg-config
            openssl

            #Alternative to `cargo test`
            cargo-nextest
          ];
          shellHook = ''
            export RUST_BACKTRACE=1
          '';
        };
      }
    );
}
