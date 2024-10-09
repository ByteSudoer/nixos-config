{ lib, extra, ... }:
{
  imports =
    [ ./docker.nix ] # Include quickemu if a desktop is defined
    ++ lib.optional (builtins.isString extra) ./quickemu.nix
    ++ lib.optional (builtins.isString extra) ./vmware.nix
    ++ lib.optional (builtins.isString extra) ./virtualbox.nix
    ++ lib.optional (builtins.isString extra) ./virt-manager.nix;

}
