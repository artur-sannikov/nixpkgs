{
  python3Packages,
  fetchFromGitHub,
  lib,
  pkgs,
}:

python3Packages.buildPythonApplication (finalAttrs: {
  pname = "metaphlan";
  version = "4.2.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "biobakery";
    repo = "MetaPhlAn";
    tag = finalAttrs.version;
    hash = "sha256-qvjC6jozhv1dz/9eC9kEU/3OHMystX0020EyzrP71eQ=";
  };

  build-system = with python3Packages; [ setuptools ];

  dependencies = with python3Packages; [
    numpy
    h5py
    biom-format
    biopython
    pandas
    scipy
    requests
    dendropy
    pysam
  ];

  nativeBuildInputs = with pkgs; [ phylophlan ];

  # buildInputs = with pkgs; [
  #   ffmpeg
  #   imagemagick
  # ];

  # Better with a patch or just submit an upstream PR?
  # postPatch = ''
  #   substituteInPlace pyproject.toml \
  #     --replace 'uv_build>=0.8.14,<0.9.0' 'uv_build>=0.8.14,<1.0.0'
  # '';

  meta = with lib; {
    description = "Compress PPTX files";
    longDescription = ''
      Compress a PPTX or POTX file, converting all PNG/TIFF images to lossy
      JPEGs.
    '';
    homepage = "https://github.com/slhck/compress-pptx";
    license = licenses.mit;
    changelog = "https://github.com/slhck/compress-pptx/releases/tag/v${finalAttrs.version}";
    mainProgram = "compress-pptx";
    maintainers = with lib.maintainers; [ artur-sannikov ];
  };
})
