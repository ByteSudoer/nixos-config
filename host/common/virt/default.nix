{ desktop, lib, extra, ... }: {
  imports = [
    ./docker.nix
  ] # Include quickemu if a desktop is defined
  ++ lib.optional (builtins.isString desktop) ./quickemu.nix
  # ++ lib.optional (builtins.isString desktop) ./vmware.nix
  ++ lib.optional (builtins.isString extra) ./virt-manager.nix;
}
