{ pkgs, ... }:
let content = builtins.readFile ./templateInit.sh;
in
pkgs.writeShellScriptBin "templateInit" ''
  echo ${content}
''
