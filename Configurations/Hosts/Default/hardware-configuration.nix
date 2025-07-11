

{ config, lib, pkgs, modulesPath, ... }:

let
  _ = lib.asserts.assertMsg false ''
    🚫 Do not rebuild directly using this hardware-configuration.nix! generate a new one using `nixos-generate-config`. Refer to the manual to see how. 
  '';
in

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  # Force an error on evaluation to prevent misuse
  abort ''
  🚫 ERROR: You are trying to build or modify hardware-configuration.nix directly.
  🚫 Do not rebuild directly using this hardware-configuration.nix! generate a new one using `nixos-generate-config`. Refer to the manual to see how. 
    sudo nixos-generate-config --root /path/to/your/nix/dir

  '';


}
