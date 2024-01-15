{ hostname
, pkgs
, lib
, ...
}:
let
  # Break these packages out so they can be imported elsewhere as a common set
  # of baseline packages. Useful for installations that are home-manager-only
  # on other OSs, rather than NixOS.
  inherit ((import ./packages.nix { inherit pkgs; })) basePackages;
in
{
  imports = [
    ./boot.nix
    ./console.nix
    ./fonts.nix
    ./locale.nix

    ../services/openssh.nix
  ];


  networking = {
    hostName = hostname;
    useDHCP = lib.mkDefault true;
  };

  environment.systemPackages = basePackages;


  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  # Create dirs for home-manager
  # systemd.tmpfiles.rules = [
  #   "d /nix/var/nix/profiles/per-user/${username} 0755 ${username} root"
  # ];
}
