{ lib
, stdenv
, fetchFromGitHub
}:
stdenv.mkDerivation rec {
  pname = "NerdFetch";
  version = "v5.0.2";
  src = fetchFromGitHub {
    owner = "ThatOneCalculator";
    repo = pname;
    #last commit hash or version number
    rev = version;
    #lib.fakeSha256;
    sha256 = "sha256-vtYDVyG5TjJY4AUCTtPPzXGYe9Hgtb41OoBCTY0bvso=";
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
