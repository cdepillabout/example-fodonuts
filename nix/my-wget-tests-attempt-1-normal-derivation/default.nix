{ cacert, my-wget, lib, stdenv }:

stdenv.mkDerivation {

  name = "my-wget-tests-attempt-1-normal-derivation";

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

