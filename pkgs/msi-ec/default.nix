{ stdenv, lib, fetchFromGithub, kernel, kmod }:

stdenv.mkDerivation rec {
  name = "msi-ec";
  version = "1.0";

  src = fetchFromGithub {
    repo = "msi-ec";
    owner = "BeardOverflow";
    rev = "853ffe3dc74f4dea1e0daeafed1a4562b4bf0130";
    hash = "";
  };

  hardeningDisable = [ "pic" "format" ];
  nativeBuildInputs = kernel.moduleBuildDependencies;

  makeFlags = [
    "KERNELRELEASE=${kernel.modDirVersion}" # 3
    "KERNEL_DIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build" # 4
    "INSTALL_MOD_PATH=$(out)" # 5
  ];
  meta = {
    description = "Embedded Controller for MSI laptops";
    homepage = "https://github.com/BeardOverflow/msi-ec";
    license = lib.licenses.gpl2;
    maintainers = with lib.maintainers; [ ByteSudoer ];
    platforms = lib.platforms.linux;
  };

}
