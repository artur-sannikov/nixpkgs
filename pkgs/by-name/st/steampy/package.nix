{
  lib,
  python3Packages,
  python3,
  fetchFromGitHub,
}:

python3Packages.buildPythonPackage rec {
  pname = "steampy";
  version = "1.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "bukson";
    repo = "steampy";
    tag = version;
    hash = "sha256-dGcqJGRQ88vXy+x2U+ykutP4RnzTUqJlmhXmcr+4maE=";
  };

  build-system = [ python3Packages.setuptools ];

  dependencies = with python3Packages; [
    beautifulsoup4
    requests
    rsa
  ];
  nativeCheckInputs = with python3Packages; [ pytestCheckHook ];

  # They all requires Steam credentials
  disabledTestPaths = [
    "test/test_client.py"
    "test/test_guard.py"
    "test/test_market.py"
  ];

  doCheck = true;
  pythonImportsCheck = [ "steampy" ];

  meta = {
    homepage = "https://github.com/bukson/steampy";
    description = "A Steam trading library";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ artur-sannikov ];
  };
}
