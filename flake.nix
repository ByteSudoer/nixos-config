{
  description = "My NixOS config";
  inputs = {
    #Nixpkgs stable release
    nixpkgs.url = "nixpkgs/nixos-23.11";
    #Nixpkgs unstable release
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    #Hardware Configuration
    nixos-hardware.url = "github:Nixos/nixos-hardware/master";

    #HomeManager Module
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager/release-23.11";
    };

    #Formatting and Linting
    nix-formatter-pack = {
      url = "github:Gerschtli/nix-formatter-pack";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-formatter-pack, ... }@inputs:
    let
      inherit (self) outputs;
      stateVersion = "23.11";
      pkgs = inputs.nixpkgs;
      inherit (nixpkgs) lib;
      libx = import ./lib { inherit inputs outputs stateVersion; };
      mkSystem = pkgs: system: hostname: 
        pkgs.lib.nixosSystem{
          inherit system;
          modules = [];
          specialArgs = {inherit inputs;};
        };
    in
    {

nixosConfigurations = {
        # bytesudoer = mkSystem inputs.nixpkgs "x86_64-linux" "bytesudoer";
        vm = mkSystem inputs.nixpkgs "x86_64-linux" "vm";
      };

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
      overlays = import ./overlays { inherit inputs outputs; };
      # Custom packages; acessible via 'nix build', 'nix shell', etc
      packages = libx.forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./pkgs { inherit pkgs; }
      );


    };
}
