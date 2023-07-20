{ cacert, my-wget, lib, stdenv }:

stdenv.mkDerivation {

  name = "my-wget-tests-attempt-2-fod";

  # This is the sha256 hash for the string "success", which is output upon this
  # test succeeding.
  outputHash = "sha256-7k4HUasQi22k9HxS2hh9UXfcNx8PUSp8quxUNOcRwJE=";
  outputHashMode = "flat";
  outputHashAlgo = "sha256";

  nativeBuildInputs = [ my-wget ];

  # Needed for people using Nix behind a proxy.
  impureEnvVars = lib.fetchers.proxyImpureEnvVars;

  buildCommand = ''
    # Make sure curl can access HTTPS sites, like GitHub.
    export SSL_CERT_FILE="${cacert}/etc/ssl/certs/ca-bundle.crt"

    wget http://google.com -O index.html

    echo success > "$out"
  '';
}

