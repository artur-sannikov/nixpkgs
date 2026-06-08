{
  lib,
  fetchFromGitHub,
  buildGoModule,
}:
buildGoModule (finalAttrs: {
  pname = "goclust";
  version = "0.2";

  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "vmikk";
    repo = "goclust";
    tag = "${finalAttrs.version}";
    hash = "sha256-1Ufw3k3hsCqNE92s2JPNCzB2n2n9kpar7hPeJzcDhDw=";
  };

  vendorHash = "";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = {
    description = "Clustering tool for sparse matrices produced by USEARCH ";
    homepage = "https://github.com/vmikk/goclust";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ artur-sannikov ];
  };
})
