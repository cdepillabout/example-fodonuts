
{ stdenv }:

stdenv.mkDerivation {
  name = "fod-example-simple";

  # This is the sha256 hash for the string "hello world", which is output upon
  # this derivation building.
  outputHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  outputHashMode = "flat";
  outputHashAlgo = "sha256";

  buildCommand = ''
    echo 'hello world' > $out
  '';
}
