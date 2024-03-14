{ lib
, stdenv
, fetchFromGitea
}:
stdenv.mkDerivation rec {
  pname = "NerdFetch";
  version = "v8.1.0";
  src = fetchFromGitea
    {
      domain = "codeberg.org";
      owner = "thatonecalculator";
      repo = "NerdFetch";
      rev = "35a06786361f139298ca75424dc0b4eb660400ec";
      hash = "sha256-Z1R0mFraDNVioN3yZAlGJMfNbDyIUBZowGFqchi6LXM=";
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
      license = licenses.mit;
    };

}
