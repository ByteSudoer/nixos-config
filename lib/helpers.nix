{
  inputs,
  outputs,
  stateVersion,
  username,
  sudo,
  ...
}:
let
  workstations = [
    "msi-nixos"
    "e16-nixos"
    "lenovo"
  ];
  virtual_machines = [
    "vm"
    "vm-mini"
  ];
in
{
  # Function to use to check if hostname is a VM
  isVM = hostname: builtins.elem hostname virtual_machines;
  # Function to use to check if hostname is a Workstation
  # Helpful for Enabling/Disabling some options globally depending on the hostname
  isWorkStation = hostname: builtins.elem hostname workstations;

  # Helper function for generating home-manager configs
  mkHome =
    {
      hostname,
      user ? username,
      desktop ? null,
    }:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = {
        inherit
          inputs
          outputs
          stateVersion
          hostname
          desktop
          ;
        username = user;
      };
      modules = [ ../home ];
    };

  # Helper function for generating host configs
  mkHost =
    {
      hostname,
      desktop ? null,
      pkgsInput ? inputs.nixpkgs,
    }:
    pkgsInput.lib.nixosSystem {
      specialArgs = {
        inherit
          inputs
          outputs
          stateVersion
          username
          hostname
          desktop
          sudo
          ;
      };
      modules = [ ../host ];
    };

  mkSystem =
    {
      hostname,
      installer ? null,
      desktop ? null,
      extra ? null,
      fs ? null,
      pkgs ? inputs.nixpkgs,
      user ? username,
      terminal ? "alacritty",
      font ? "JetBrainsMono",
      browser ? null,
      filemanager ? null,
      colorscheme ? "dracula",
      platform ? "x86_64-linux",
      sudo ? "sudo",
    }:
    pkgs.lib.nixosSystem {
      specialArgs = {
        inherit
          inputs
          outputs
          stateVersion
          platform
          username
          hostname
          desktop
          terminal
          font
          browser
          filemanager
          extra
          fs
          colorscheme
          sudo
          ;
      };

      modules = [
        ../host
        inputs.auto-cpufreq.nixosModules.default
        inputs.sops.nixosModules.sops
        inputs.disko.nixosModules.disko
        inputs.home-manager.nixosModules.home-manager
        inputs.home-manager.nixosModules.home-manager
        #inputs.nixvirt.nixosModules.default
        {
          home-manager = {

            useUserPackages = true;
            useGlobalPkgs = true;

            users.${username} = ../. + "/home";
            extraSpecialArgs = {
              inherit
                inputs
                outputs
                stateVersion
                hostname
                desktop
                extra
                colorscheme
                terminal
                browser
                filemanager
                font
                sudo

                ;
              username = user;
            };
            # Ensure Plasma Manager is available:
            sharedModules = [
              inputs.sops.homeManagerModules.sops
              # inputs.hyprland.homeManagerModules.default
              inputs.nix-index-database.homeModules.nix-index
              inputs.plasma-manager.homeModules.plasma-manager
              #inputs.catppuccin.homeModules.catppuccin
            ];

          };
        }
      ]
      ++ (inputs.nixpkgs.lib.optionals (installer != null) [ installer ]);

    };

  forAllSystems = inputs.nixpkgs.lib.genAttrs [
    "aarch64-linux"
    "i686-linux"
    "x86_64-linux"
    "aarch64-darwin"
    "x86_64-darwin"
  ];
}
