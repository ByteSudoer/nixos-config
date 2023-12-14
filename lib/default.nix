{ inputs, outputs, stateVersion, username,colorscheme, ... }:
let
  helpers = import ./helpers.nix { inherit inputs outputs stateVersion username colorscheme; };
in
{
  inherit (helpers) mkHome mkHost mkSystem forAllSystems;
}
