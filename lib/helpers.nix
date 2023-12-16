{ inputs, outputs, stateVersion, username, ... }: {
  # Helper function for generating home-manager configs
  mkHome = { hostname, user ? username, desktop ? null }: inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    extraSpecialArgs = {
      inherit inputs outputs stateVersion hostname desktop;
      username = user;
    };
    modules = [ ../home ];
  };

  # Helper function for generating host configs
  mkHost = { hostname, desktop ? null, pkgsInput ? inputs.nixpkgs }: pkgsInput.lib.nixosSystem {
    specialArgs = {
      inherit inputs outputs stateVersion username hostname desktop;
    };
    modules = [
      ../host
    ];
  };

  mkSystem = { hostname, installer ? null, desktop ? null, pkgs ? inputs.nixpkgs, user ? username, colorscheme ? "dracula", platform ? "x86_64-linux" }: pkgs.lib.nixosSystem {
    specialArgs = {
      inherit inputs outputs stateVersion platform username hostname desktop colorscheme;
    };

    modules = [
      ../host
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {

          useUserPackages = true;

          users.${username} = ../. + "/home";
          extraSpecialArgs = {
            inherit inputs outputs stateVersion hostname desktop colorscheme;
            username = user;
          };
          # Ensure Plasma Manager is available:
          sharedModules = [
            inputs.plasma-manager.homeManagerModules.plasma-manager
          ];

        };
      }
    ] ++ (inputs.nixpkgs.lib.optionals (installer != null) [ installer ]);

  };



  forAllSystems = inputs.nixpkgs.lib.genAttrs [
    "aarch64-linux"
    "i686-linux"
    "x86_64-linux"
    "aarch64-darwin"
    "x86_64-darwin"
  ];
}
