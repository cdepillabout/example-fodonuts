{ cacert, curl, lib, stdenv }:

stdenv.mkDerivation {

  name = "fod-example";

  # This is the sha256 hash for the string "success", which is output upon this
  # test succeeding.
  outputHash = "sha256-gbK9TqmMjbZlVPvI12N6GmmhMPMx/rcyt1yqtMSGj9U=";
  outputHashMode = "flat";
  outputHashAlgo = "sha256";

  nativeBuildInputs = [ curl ];

  # Needed for people using Nix behind a proxy.
  impureEnvVars = lib.fetchers.proxyImpureEnvVars;

  buildCommand = ''
    curl=(
      curl --location --max-redirs 20 --retry 3 --disable-epsv
      --cookie-jar cookies --user-agent "curl " --insecure
    )

    # Make sure curl can access HTTPS sites, like GitHub.
    export SSL_CERT_FILE="${cacert}/etc/ssl/certs/ca-bundle.crt"

    "''${curl[@]}" "https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz" > $out
  '';
}
