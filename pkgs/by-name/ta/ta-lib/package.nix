{
  lib,
  stdenv,
  fetchFromGitHub,
  autoreconfHook,
  pkg-config,
}:

stdenv.mkDerivation rec {
  pname = "ta-lib";
  version = "0.6.3";
  src = fetchFromGitHub {
    owner = "ta-lib";
    repo = "ta-lib";
    rev = "v0.6.3";
    sha256 = "sha256-/dBMrZH30htqHcQjMH3x++t/Ktn9P9WKH3OvXFbDDTI=";
  };

  nativeBuildInputs = [
    pkg-config
    autoreconfHook
  ];
  hardeningDisable = [ "format" ];

  meta = with lib; {
    description = "TA-Lib is a library that provides common functions for the technical analysis of financial market data.";
    mainProgram = "ta-lib-config";
    homepage = "https://ta-lib.org/";
    license = lib.licenses.bsd3;

    platforms = platforms.linux;
    maintainers = with maintainers; [ rafael ];
  };
}
