{ my-wget, lib, stdenv }:

stdenv.mkDerivation {

  name = "my-wget-tests-attempt-2-fod";

  # This is the sha256 hash for the string "success", which is output upon this
  # test succeeding.
  outputHash = "sha256-gbK9TqmMjbZlVPvI12N6GmmhMPMx/rcyt1yqtMSGj9U=";
  outputHashMode = "flat";
  outputHashAlgo = "sha256";

  nativeBuildInputs = [ my-wget ];

  # Needed for people using Nix behind a proxy.
  impureEnvVars = lib.fetchers.proxyImpureEnvVars;

  buildCommand = ''
    wget http://www.google.com -O index.html

    echo success > "$out"
  '';
}
