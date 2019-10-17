{ config ? {}, overlays ? [], nixpkgs ? import ./nixpkgs.nix, ihaskell }:

let
  defaultOverlays = [
    (import ./haskell-overlay.nix { inherit ihaskell; })
    (import ./python-overlay.nix)
  ];
  overlaysAll = defaultOverlays ++ overlays;
in
  nixpkgs { inherit config; overlays=overlaysAll; }
