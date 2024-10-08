{ lib
, python3
, fetchPypi
, gtk3
, hicolor-icon-theme
, autoPatchelfHook

}:

python3.pkgs.buildPythonApplication rec {
  pname = "tlp-ui";
  version = "1.6.5";
  pyproject = true;

  src = fetchPypi {
    pname = "tlp_ui";
    inherit version;
    hash = "sha256-NuHo7VC6edRPJrRxZg8iJqvwBQ2PlOW55Pfhn7WB5i0=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    python3.pkgs.poetry-core
  ];

  propagatedBuildInputs = with python3.pkgs; [
    pygobject3
    pyyaml
  ];

  buildInputs = [
    gtk3
    hicolor-icon-theme
  ];

  # pythonImportsCheck = [ "tlp_ui" ];

  meta = with lib; {
    description = "GTK UI for tlp";
    homepage = "https://pypi.org/project/tlp-ui/";
    license = licenses.gpl2Only;
    maintainers = with maintainers; [ ByteSudoer ];
    mainProgram = "tlp-ui";
  };
}
