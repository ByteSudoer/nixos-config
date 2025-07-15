{
  description = "Nix Shell For Python development";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
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
            (python3.withPackages (ps: with ps; [ requests ]))
            python3
            #The PyPA recommended tool for installing Python packages
            python311Packages.pip
            virtualenv
            # For LSP
            pylint
            nodePackages_latest.pyright
          ];
          # shellHook = ''
          # '';
        };
      }
    );
}
