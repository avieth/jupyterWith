{ config ? {}, overlays ? [], nixpkgsSrc ? ./nixpkgs.nix }:

let
  defaultOverlays = [
    (import ./haskell-overlay.nix)
    (import ./python-overlay.nix)
  ];
  overlaysAll = defaultOverlays ++ overlays;
in
  import nixpkgsSrc { inherit config; overlays=overlaysAll; }
