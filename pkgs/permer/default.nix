{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage rec {
  pname = "Permer";
  version = "1.1.0";
  src = fetchFromGitHub {
    owner = "ByteSudoer";
    repo = pname;
    version = version;
    sha256 = "sha256-OlGjXrg2Zd4Y6eEtXyGGxRd+qiCEKFGT41mKb8fFh9A=";
  };

  # cargoHash = "sha256-66zqPDHPpSnPBXDh5r4Mq7FruTsEo4lrtSZJNc5w5zg=";

  meta = with lib; {
    description = "A Rust CLI tool to check file permissions";
    homepage = "https://github.com/ByteSudoer/Permer.git";
  };
}
