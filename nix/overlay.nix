
final: prev: {

  fod-example-simple = final.callPackage ./fod-example-simple {};

  fod-example = final.callPackage ./fod-example {};

  my-wget = final.wget.overrideAttrs { pname = "my-wget"; };

  my-wget-tests-attempt-1-normal-derivation = final.callPackage ./my-wget-tests-attempt-1-normal-derivation {};

  my-wget-tests-attempt-2-fod = final.callPackage ./my-wget-tests-attempt-2-fod {};

  my-wget-tests-attempt-3-fod-special-name = final.callPackage ./my-wget-tests-attempt-2-fod-special-name {};
}
