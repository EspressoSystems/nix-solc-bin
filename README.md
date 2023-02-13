# Solc nix derivation with patched official binaries

For convenient access to all released solc version with nix.

Binaries from https://github.com/ethereum/solc-bin.

### Usage
- See [the template](./templates/default/flake.nix) for example usage in a `flake.nix`.
- Run as flake app: `nix run github:EspressoSystems/nix-solc-bin`
- See available versions: `nix flake show github:EspressoSystems/nix-solc-bin`

### Updating
Run `./update-sources.sh` to fetch new solidity builds.
