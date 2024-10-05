{ lib, hostname, ... }:
let
  isInList = element: list: builtins.elem element list;
  hostnames = [
    "vm"
    "vm-mini"
  ];
in
{
  programs.ssh.startAgent = true;
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = isInList hostname hostnames;
      PermitRootLogin = lib.mkDefault "no";
    };
  };
}
