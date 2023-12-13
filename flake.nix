{
  description = "ByteSudoer's NixOS Config";
  inputs = {
    #Stable Branch
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    #Unstable Branch
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    #Nixos Hardware Repository
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nix-formatter-pack = {
      url = "github:Gerschtli/nix-formatter-pack";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs-unstable";

    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    { self
    , nixpkgs-unstable
    , nix-formatter-pack
    , ...
    } @ inputs:

    let
      inherit (self) outputs;
      stateVersion = "23.11";
      username = "bytesudoer";
      libx = import ./lib { inherit inputs outputs stateVersion username; };
    in
    {


      nixosConfiguration = {
        vm = libx.mkSystem {hostname="vm"; desktop="plasma";};

      };

      formatter = libx.forAllSystems (system:
        nix-formatter-pack.lib.mkFormatter {
          pkgs = nixpkgs-unstable.legacyPackages.${system};
          config.tools = {
            deadnix.enable = true;
            nixpkgs-fmt.enable = true;
            statix.enable = true;
          };
        }
      );


      # Custom packages; acessible via 'nix build', 'nix shell', etc
      packages = libx.forAllSystems (system:
        let pkgs = nixpkgs-unstable.legacyPackages.${system};
        in import ./pkgs { inherit pkgs; }
      );

      # Custom overlays
      overlays = import ./overlays { inherit inputs; };

      # Devshell for bootstrapping
      # Accessible via 'nix develop' or 'nix-shell' (legacy)
      devShells = libx.forAllSystems (system:
        let pkgs = nixpkgs-unstable.legacyPackages.${system};
        in import ./shell.nix { inherit pkgs; }
      );

    };
}
