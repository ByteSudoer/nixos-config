{ lib
, stdenv
, fetchFromGitHub
, fetchgit
}:
stdenv.mkDerivation rec {
  pname = "NerdFetch";
  version = "v5.0.2";
  src = fetchgit {
    url = "https://codeberg.org/thatonecalculator/NerdFetch.git";
    hash = "sha256-olDOu+dxn6JEnolcYgodq98y/ek+aGdDKT5cUAIBums=";
  };
  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;
  installPhase = ''
    mkdir -p $out/bin
      cp $src/nerdfetch $out/bin
  '';

  meta = with lib;
    {
      description = "A POSIX *nix (Linux, macOS, Android, *BSD, etc) fetch script using Nerdfonts";
      homepage = "https://codeberg.org/thatonecalculator/nerdfetch";
    };

}
