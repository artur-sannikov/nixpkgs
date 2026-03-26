{
  python3Packages,
  fetchFromGitHub,
  lib,
  pkgs,
}:

python3Packages.buildPythonApplication (finalAttrs: {
  pname = "humann";
  version = "3.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "biobakery";
    repo = "humann";
    tag = "v${finalAttrs.version}";
    hash = "sha256-ADvxuqUQY1f6O14g20n4YFdCBMS1xsoDDv5+f1uQ/pU=";
  };

  build-system = with python3Packages; [ setuptools ];

  # Add Metaphaln
  buildInputs = with pkgs; [ bowtie2 ];

  meta = with lib; {
    description = "Next generation of HUMAnN 1.0 (HMP Unified Metabolic Analysis Network)";
    homepage = "https://github.com/biobakery/humann";
    license = licenses.mit;
    mainProgram = "humann";
    maintainers = with lib.maintainers; [ artur-sannikov ];
  };
})
