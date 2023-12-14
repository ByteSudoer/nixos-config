{ pkgs, ... }:
let
  content = builtins.readFile ./sp.sh;
in
pkgs.writeShellScriptBin "sp" ''

  echo ${content}
''
