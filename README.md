# ByteSudoer's nixos-config

This repository contains a [Nix Flake](https://nixos.wiki/wiki/Flakes) for configuring my machines.

## Structure

- [home]: my home-manager configuration
- [host]: host-specific configurations
- [overlays]: package/configuration overlays
- [pkgs]: my custom package definitions
- [scripts]: helper scripts for machine setup

<!-- Structure -->

[home]: ./home
[host]: ./host
[overlays]: ./overlays
[pkgs]: ./pkgs
[scripts]: ./scripts

## TODO

- [x] Add Disko support for different host
- [x] Add nix-index to home-manager
- [x] Encrypt Secrets with sops
- [x] Configure env variables for hyprland with colorscheme global variable support
- [ ] Documentation for nix-ld(whether to integrate it or not)
- [ ] xdg-override check for possible use cases
- [ ] NixVirt check for possible use cases (already added as flake input)
