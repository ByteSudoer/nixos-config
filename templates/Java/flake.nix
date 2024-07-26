{
  description = "Nix Shell for Java development";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        javaVersion = 21; # Change this value to update the whole stack
        overlays = [
          (_final: prev: rec {
            jdk = prev."jdk${toString javaVersion}";
            gradle = prev.gradle.override { java = jdk; };
            maven = prev.maven.override { inherit jdk; };
          })
        ];
        pkgs = import nixpkgs { inherit overlays system; };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            gradle
            jdk
            maven
          ];
          # shellHook = ''
          # '';
        };
      }
    );
}
