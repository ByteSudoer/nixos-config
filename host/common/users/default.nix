{ lib
, username
, ...
}:
{
  imports = [ ./root ] ++ lib.optional (builtins.pathExists (./. + "/${username}")) ./${username};
}
