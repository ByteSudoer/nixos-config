{
  description = "Nix Shell for Java development";
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
          jdk
          # Build tools
          maven
          ant
          gradle
          #Editor
          eclipses.eclipse-java
          # jetbrains.idea-community
        ];
        # shellHook = ''
        # '';
      };
    }
    );
}
