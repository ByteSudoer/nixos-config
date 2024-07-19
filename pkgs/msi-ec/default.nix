{ stdenv, lib, fetchFromGitHub, kernel, kmod }:

#https://wiki.nixos.org/wiki/Linux_kernel
stdenv.mkDerivation rec {
  name = "msi-ec";
  version = "1.0";

  src = fetchFromGitHub {
    repo = "msi-ec";
    owner = "BeardOverflow";
    rev = "853ffe3dc74f4dea1e0daeafed1a4562b4bf0130";
    hash = "sha256-5HdK34NRcVogIzZNDW5nmTLzBzCS1W+Yb31uX3wWMzA=";
  };

  KVER = "${kernel.modDirVersion}";
  KBUILD_DIR = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";

  hardeningDisable = [ "pic" ];
  setSourceRoot = ''
    export sourceRoot=$(pwd)/${src.name}
  '';



  nativeBuildInputs = kernel.moduleBuildDependencies;

  makeFlags = [
    "-C"
    "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
    "M=$(sourceRoot)"
    "VERSION=${version}"
    "INSTALL_MOD_PATH=$(out)"
  ];

  buildFlags = [ "modules" ];
  installFlags = [ "INSTALL_MOD_PATH=$(out)" ];




  # installPhase = ''
  #   mkdir -p $out/lib/modules/${KVER}/extra
  #   cp msi-ec.ko $out/lib/modules/${KVER}/extra
  # '';
  meta = {
    description = "Embedded Controller for MSI laptops";
    homepage = "https://github.com/BeardOverflow/msi-ec";
    license = lib.licenses.gpl2;
    maintainers = with lib.maintainers; [ ByteSudoer ];
    platforms = lib.platforms.linux;
  };

}
