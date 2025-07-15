{
  description = "ByteSudoer's NixOS Config";
  inputs = {
    #Stable Branch
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    #Unstable Branch
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    #Nixos Hardware Repository
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    #Nix Formatting and Linting tools
    nix-formatter-pack = {
      url = "github:Gerschtli/nix-formatter-pack";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    #Configure Partitions and Disk Layout declaratively
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    #Atomic, declarative, and reproducible secret provisioning
    sops = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #Manage Home Directory and ~/.config
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # hyprland = {
    #   url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    # };
    #Automatic CPU speed & power optimizer for Linux
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #Manage Plasma Desktop
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    #Locate Binaries and Libraries in nixpkgs
    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Declare VM (libvirt domains)
    # nixvirt = {
    #   url = "https://flakehub.com/f/AshleyYakeley/NixVirt/*.tar.gz";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    nix-colors.url = "github:misterio77/nix-colors";

  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      nix-formatter-pack,
      ...
    }@inputs:

    let
      inherit (self) outputs;
      stateVersion = "25.05";
      username = "bytesudoer";
      colorscheme = "dracula";
      desktop = "xfce";
      terminal = "alacritty";
      filemanager = "thunar";
      font = "JetBrainsMono";
      browser = "firefox";
      # Implementations of sudo : [doas,sudo,sudo-rs]
      sudo = "sudo-rs";

      libx = import ./lib {
        inherit
          inputs
          outputs
          stateVersion
          username
          colorscheme
          terminal
          font
          browser
          filemanager
          sudo
          ;
      };
    in
    {
      nixosConfigurations = {
        # ISO imagegs
        #  - nix build .#nixosConfigurations.{iso-console|iso-desktop}.config.system.build.isoImage
        iso-console = libx.mkSystem {
          hostname = "iso-console";
          installer = nixpkgs + "/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix";
        };
        iso-desktop = libx.mkSystem {
          hostname = "iso-desktop";
          colorscheme = "${colorscheme}";
          installer = nixpkgs + "/nixos/modules/installer/cd-dvd/installation-cd-graphical-calamares.nix";
          desktop = "plasma";
        };

        #WorkStations
        e16-nixos = libx.mkSystem {
          hostname = "e16-nixos";
          desktop = "${desktop}";
          colorscheme = "${colorscheme}";
          terminal = "${terminal}";
          font = "${font}";
          browser = "${browser}";
          filemanager = "${filemanager}";
          sudo = sudo;
          extra = "yes";
        };
        msi-nixos = libx.mkSystem {
          hostname = "msi-nixos";
          desktop = "${desktop}";
          colorscheme = "${colorscheme}";
          extra = "yes";
        };
        lenovo = libx.mkSystem {
          hostname = "lenovo";
          desktop = "plasma";
          colorscheme = "gruvbox";
        };
        vm = libx.mkSystem {
          hostname = "vm";
          desktop = "plasma";
          colorscheme = "gruvbox";
        };

        #Servers
        vm-mini = libx.mkSystem {
          hostname = "vm-mini";
          colorscheme = "${colorscheme}";
          fs = "btrfs";
        };

      };

      homeManagerModules = import ./modules/home-manager;

      formatter = libx.forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);

      checks = libx.forAllSystems (system: {
        checks = {
          nix-formatter-pack = nix-formatter-pack.lib.mkCheck {
            inherit nixpkgs system;

            config = {
              tools = {
                deadnix.enable = true;
                nixpkgs-fmt.enable = true;
                statix.enable = true;
              };
            };

            checkFiles = [ ./. ];
          };
        };
      });
      # Custom packages; acessible via 'nix build', 'nix shell', etc
      packages = libx.forAllSystems (
        system:
        let
          pkgs = nixpkgs-unstable.legacyPackages.${system};
        in
        import ./pkgs { inherit pkgs colorscheme; }
      );

      # Custom overlays
      overlays = import ./overlays { inherit inputs colorscheme; };

      # Devshell for bootstrapping
      # Accessible via 'nix develop' or 'nix-shell' (legacy)
      devShells = libx.forAllSystems (
        system:
        let
          pkgs = nixpkgs-unstable.legacyPackages.${system};
        in
        import ./shell.nix { inherit pkgs; }
      );

    };
}
