
{ stdenv }:

stdenv.mkDerivation {
  name = "fod-example-simple";

  # This is the sha256 hash for the string "hello world", which is output upon
  # this derivation building.
  outputHash = "sha256-qUiQTy8PR5uPgZdpSzAYSw0u0cHNKh7A+4XSmaGSpEc=";
  outputHashMode = "flat";
  outputHashAlgo = "sha256";

  buildCommand = ''
    echo 'hello world' > $out
  '';
}
