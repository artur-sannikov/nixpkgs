{
  python3Packages,
  fetchFromGitHub,
  lib,
  pkgs,
}:

python3Packages.buildPythonApplication (finalAttrs: {
  pname = "steamcloudsavedownloader";
  version = "0.0.84";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pyscsd";
    repo = "steamCloudSaveDownloader";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Et70//rye8n7B/4+Mla1kLXkB/sZu5cj8tDde3AXd7E=";
  };

  # build-system = with python3Packages; [ uv-build ];
  build-system = with python3Packages; [ setuptools ];

  # dependencies = with python3Packages; [
  #   ffmpeg-progress-yield
  #   tqdm
  # ];

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
    # mainProgram = "compress-pptx";
    maintainers = with lib.maintainers; [ artur-sannikov ];
  };
})
