{
  description = "Nix Shell For Go develoment";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs
    , flake-utils
    , ...
    }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      goVersion = 20;
      overlays = [ (_final: prev: { go = prev."go_1_${toString goVersion}"; }) ];
      pkgs = import nixpkgs { inherit overlays system; };
    in
    {
      devShells.default = pkgs.mkShell {
        name = "Go-Dev-Shell";
        packages = with pkgs;[
          go
          gotools
          golangci-lint
        ];
      };
    }
    );
}
