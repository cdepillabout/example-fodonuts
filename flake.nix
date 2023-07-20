{
  description = "Examples of fixed-output derivations for operating network-utilizing tests";

  inputs.nixpkgs.url = "nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; overlays = [ self.overlay ]; });
    in
    {
      overlay = import ./nix/overlay.nix;

      packages =
        forAllSystems
          (system: {
            inherit (nixpkgsFor.${system})
              fod-example-simple
              fod-example
              my-wget
              my-wget-tests-attempt-1-normal-derivation
              my-wget-tests-attempt-2-fod
              ;
          });

      # defaultPackage = forAllSystems (system: self.packages.${system}.evilExample);
    };
}
