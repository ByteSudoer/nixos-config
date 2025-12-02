{
  description = "Nix Shell for PHP/Symfony dev";
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
        services.httpd.phpPackage = pkgs.php.buildEnv {
          extensions = { enabled, all }: enabled ++ (with all; [ xdebug ]);
        };
        services.mysql = {
          enable = true;
          dataDir = "/var/lib/mysql";
          host = "localhost";
        };
        # virtualisation.docker = {
        #   enable = true;
        #   enableOnBoot = true;
        # };
        virtualisation.oci-containers = {
          backend = "docker";
          containers = {
            phpmyAdmin = {
              image = "phpmyadmin:latest";
              ports = [ "127.0.0.1:80:80" ];
            };
          };
        };
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            php
            symfony-cli
            php81Packages.composer
          ];
          shellHook = "";
        };
      }
    );
}
