{ pgks }:
pkgs.stdenv.mkDerivation {
  name = "sddm-gruvbox";
  src = pkgs.fetchFromGitHub {
    owner = "scientiac";
    repo = "gruvbox-minimal-sddm";
    rev = "af0e63389031619edbe93d71f44a5ece50edc1a2";
    sha256 = "01jclmwz93z19644zq8rsi6lw8nxlaaszr4fyllw4kv71q5c19q8";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
