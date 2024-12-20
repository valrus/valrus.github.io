with import <nixpkgs> { };

let
  pythonPackages = python3Packages;
in pkgs.mkShell rec {
  name = "peppermynt";
  venvDir = "./.venv";
  buildInputs = [
    pythonPackages.python
    pythonPackages.venvShellHook
    pandoc
    haskellPackages.pandoc-sidenote
    uglify-js
  ];

  postVenvCreation = ''
    unset SOURCE_DATE_EPOCH
  '';

  postShellHook = ''
    unset SOURCE_DATE_EPOCH
    pip install --upgrade setuptools
    pip install -e $HOME/Code/peppermynt
  '';
}
