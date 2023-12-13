{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "sddm-tokyonight-theme";
  src = pkgs.fetchFromGitHub {
    owner = "rototrash";
    repo = "tokyo-night-sddm";
    rev = "320c8e74ade1e94f640708eee0b9a75a395697c6";
    sha256 = "1h20b7n6a4pbqnrj22y8v5gc01zxs58lck3bipmgkpyp52ip3vig";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out
  '';
}
