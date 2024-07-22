{ lib
, stdenv
, fetchFromGitHub
, cmake
, qt5

}:

stdenv.mkDerivation rec {
  pname = "m-control-center";
  version = "0.4.1";

  src = fetchFromGitHub {
    owner = "dmitry-s93";
    repo = "MControlCenter";
    rev = version;
    hash = "sha256-SV78OVRGzy2zFLT3xqeUtbjlh81Z97PVao18P3h/8dI=";
  };

  nativeBuildInputs = [
    cmake
    qt5.wrapQtAppsHook
  ];

  buildInputs = [
    qt5.qtbase
    qt5.full
  ];

  meta = with lib; {
    description = "An application that allows you to change the settings of MSI laptops running Linux";
    homepage = "https://github.com/dmitry-s93/MControlCenter";
    changelog = "https://github.com/dmitry-s93/MControlCenter/blob/${src.rev}/CHANGELOG.md";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ ByteSudoer ];
    mainProgram = "m-control-center";
    platforms = platforms.all;
  };
}
