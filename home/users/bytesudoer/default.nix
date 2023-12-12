{ inputs, lib, hostname, ... }: {
  imports = [
    inputs.vscode-server.nixosModules.home
  ]
  ++ lib.optional (builtins.pathExists (./. + "/${hostname}.nix")) ./${hostname}.nix;

}
