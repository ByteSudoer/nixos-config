{ lib
, stdenv
, fetchFromGitea
}:
stdenv.mkDerivation rec {
  pname = "NerdFetch";
  version = "v5.0.2";
  src = fetchFromGitea
    {
      domain = "codeberg.org";
      owner = "thatonecalculator";
      repo = "NerdFetch";
      rev = "228ad50b770a5bc02ad073dcfdbb687e912aa6de";
      hash = "sha256-2Adxh0UlmAovYPk3R4yYDpW5RBZgPSNkEj+C+9DaiLE=";
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
