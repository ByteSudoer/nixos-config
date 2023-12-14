{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage rec {
  pname = "Permer";
  version = "d5c47102922c219c1660a03ba07c1e0504558b46";
  src = fetchFromGitHub {
    owner = "ByteSudoer";
    repo = pname;
    rev = version;
    # sha256 = "sha256-OlGjXrg2Zd4Y6eEtXyGGxRd+qiCEKFGT41mKb8fFh9A=";
    sha256 = "sha256-0YJwyz/wVVy+af4BrrppokmKA0mAq0oVmezzCa5N7mk=";

  };

  cargoHash = lib.fakeHash;

  meta = with lib; {
    description = "A Rust CLI tool to check file permissions";
    homepage = "https://github.com/ByteSudoer/Permer.git";
  };
}
