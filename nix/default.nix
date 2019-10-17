{ config ? {}, overlays ? [], nixpkgsSrc ? ./nixpkgs.nix, ihaskellSrc }:

let
  defaultOverlays = [
    (import ./haskell-overlay.nix { inherit ihaskellSrc; })
    (import ./python-overlay.nix)
  ];
  overlaysAll = defaultOverlays ++ overlays;
in
  import nixpkgsSrc { inherit config; overlays=overlaysAll; }
