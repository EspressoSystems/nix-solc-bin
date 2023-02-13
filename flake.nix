{
  description = "Solc from binary";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      rec {
        packages = import ./default.nix { inherit (pkgs) stdenv lib fetchurl autoPatchelfHook; };
        apps = rec {
          default = apps.solc-bin;
          solc-bin = flake-utils.lib.mkApp { name = "solc"; drv = packages.default; };
        };
        overlays.default = final: prev: {
          solc-bin = self.packages.${prev.system};
        };
        templates = {
          default = {
            path = ./templates/default;
            description = "Solc-bin template";
          };
        };
      }
    );
}
