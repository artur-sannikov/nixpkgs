{
  lib,
  stdenv,
  fetchFromGitHub,
  perl,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "trnascan-se";
  version = "2.0.12";

  src = fetchFromGitHub {
    owner = "UCSC-LoweLab";
    repo = "tRNAscan-SE";
    tag = "v${finalAttrs.version}";
    hash = "sha256-vQ17yLQPn4iZVY4jAD8W2J/CNOkP80T4NwcVyu+5CZc=";
  };

  env.NIX_CFLAGS_COMPILE = toString ([
    "-std=gnu89"
  ]);

  nativeBuildInputs = [
    perl
  ];

  meta = with lib; {
    description = "Program for detection of tRNA genes";
    homepage = "https://github.com/UCSC-LoweLab/tRNAscan-SE";
    changelog = "https://github.com/UCSC-LoweLab/tRNAscan-SE/v${finalAttrs.version}";
    license = licenses.mit;
    maintainers = with maintainers; [ artur-sannikov ];
  };
})
