{ pkgs, ... }:
let
  content = builtins.readFile ./mediaplayer.py;
in
pkgs.writeShellScriptBin "lock" ''
  echo ${content}
''
