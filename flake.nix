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

  outputs = { self, nixpkgs,nix-formatter-pack, ... }@inputs:
  let
    stateVersion = "23.11";
    pkgs = inputs.nixpkgs;
    inherit (nixpkgs) lib;
    libx = import ./lib {inherit inputs outputs stateVersion;};
    in
   {


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

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
}
