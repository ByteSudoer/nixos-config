{
  inputs,
  outputs,
  stateVersion,
  username,
  colorscheme,
  terminal,
  browser,
  font,
  filemanager,
  ...
}:
let
  helpers = import ./helpers.nix {
    inherit
      inputs
      outputs
      stateVersion
      username
      colorscheme
      terminal
      font
      browser
      filemanager
      ;
  };
in
{
  inherit (helpers)
    mkHome
    mkHost
    mkSystem
    forAllSystems
    ;
}
