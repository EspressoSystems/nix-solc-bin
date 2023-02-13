{
  description = "Solc-bin flake template";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";
  inputs.solc-bin.url = "github:EspressoSystems/nix-solc-bin";
  # inputs.solc-bin.url = "path:../../.";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils, solc-bin }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ solc-bin.overlays.${system}.default ];
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.solc-bin.default # the latest version
            pkgs.solc-bin."0.8.0" # an older version
          ];
        };
      }
    );
}
