{ desktop, lib, ... }: {
  imports = [
    ./docker.nix
  ] # Include quickemu if a desktop is defined
  ++ lib.optional (builtins.isString desktop) ./quickemu.nix
  ++ lib.optional (builtins.isString desktop) ./vmware.nix;
}
