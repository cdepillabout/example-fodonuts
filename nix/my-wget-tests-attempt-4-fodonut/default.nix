{ my-wget, lib, stdenv }:

let
  buildCommand = ''
    wget http://www.google.com -O index.html

    echo success > "$out"
  '';

  value-to-hash = buildCommand + my-wget.outPath;

  test-name-hash = builtins.hashString "md5" value-to-hash;
in

stdenv.mkDerivation {

  name = "my-wget-tests-attempt-4-fodonut-${test-name-hash}";

  # This is the sha256 hash for the string "success", which is output upon this
  # test succeeding.
  outputHash = "sha256-gbK9TqmMjbZlVPvI12N6GmmhMPMx/rcyt1yqtMSGj9U=";
  outputHashMode = "flat";
  outputHashAlgo = "sha256";

  nativeBuildInputs = [ my-wget ];

  # Needed for people using Nix behind a proxy.
  impureEnvVars = lib.fetchers.proxyImpureEnvVars;

  inherit buildCommand;
}
