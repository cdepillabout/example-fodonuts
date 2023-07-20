{ my-wget, lib, stdenv }:

stdenv.mkDerivation {

  name = "my-wget-tests-attempt-1-normal-derivation";

  nativeBuildInputs = [ my-wget ];

  # Needed for people using Nix behind a proxy.
  impureEnvVars = lib.fetchers.proxyImpureEnvVars;

  buildCommand = ''
    wget http://www.google.com -O index.html

    echo success > "$out"
  '';
}
