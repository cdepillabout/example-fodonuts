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

      packages = forAllSystems (system: { inherit (nixpkgsFor.${system}) evilExample; });

      defaultPackage = forAllSystems (system: self.packages.${system}.evilExample);
    };
}
