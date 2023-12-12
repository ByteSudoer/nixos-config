{
  description = "ByteSudoer's Nixos Config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    agenix = {

      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-formatter-pack = {
      url = "github:Gerschtli/nix-formatter-pack";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, nix-formatter-pack, ... }@ inputs:
    let
      inherit (self) outputs;
      libx = import ./lib { inherit inputs outputs stateVersion; };

      username = "bytesudoer";
      stateVersion = "23.11";
    in
    {

      # nix build .#homeConfigurations."jon@freyja".activationPackage
      homeConfigurations = {
        # Desktop machines
        "${username}@nixos" = libx.mkHome { hostname = "nixos"; desktop = "plasma"; };
      };


      # nix build .#nixosConfigurations.freyja.config.system.build.toplevel
      nixosConfigurations = {
        # Virtual machines
        vm = libx.mkHost { hostname = "vm"; desktop = "plasma"; username = "bytesudoer"; };
      };

      # nix fmt
      formatter = libx.forAllSystems (system:
        nix-formatter-pack.lib.mkFormatter {
          pkgs = nixpkgs.legacyPackages.${system};
          config.tools = {
            alejandra.enable = false;
            deadnix.enable = true;
            nixpkgs-fmt.enable = true;
            statix.enable = true;
          };
        }
      );
      # Devshell for bootstrapping; acessible via 'nix develop' or 'nix-shell' (legacy)
      devShells = libx.forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./shell.nix { inherit pkgs; }
      );
      # Custom packages and modifications, exported as overlays
      overlays = import ./overlays { inherit inputs; };

      # Custom packages; acessible via 'nix build', 'nix shell', etc
      packages = libx.forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./pkgs { inherit pkgs; }
      );


    };
}
