# Build a package for a given version of python
{
  renderers,
}:
python:
let
  attrs = renderers.buildPythonPackage { inherit python; };
  inherit (python.pkgs) buildPythonPackage;
in
buildPythonPackage (attrs)
