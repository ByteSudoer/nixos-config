{ pkgs, ... }:
let
  content = builtins.readFile ./bettery_info.sh;
in
pkgs.writeShellScriptBin "battery_info" ''
  echo ${content}
''
