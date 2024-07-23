{ config, lib, pkgs, ... }:
{
  ngrok-module = import ./programs/ngrok.nix { inherit config lib pkgs; };
}
