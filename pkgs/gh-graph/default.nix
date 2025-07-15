{
  lib,
  fetchFromGitHub,
  curl,
  github-cli,
  stdenv,
}:

stdenv.mkDerivation rec {
  pname = "gh-graph";
  version = "unstable-2021";
  src = fetchFromGitHub {
    owner = "kawarimidoll";
    repo = "gh-graph";
    rev = "30a1fa20a8ed7e4d05014358e7cbd8e369c8c400";
    hash = "sha256-pyyEGsx5i/W7Ys4COuFg5vnwgubm/y5hz0nFL5EfF8I=";
  };

  dontUnpack = true;
  dontBuild = true;
  dontConfigure = true;

  buildInputs = [
    curl
    github-cli
  ];

  installPhase = ''
    runHook preInstall
      mkdir -p $out/bin
      cp ${src}/gh-graph $out/bin/gh-graph
    runHook postInstall
  '';

  meta = {
    homepage = "https://github.com/kawarimidoll/gh-graph";
    description = "GitHub contribution graph in your terminal";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ByteSudoer ];
  };
}
