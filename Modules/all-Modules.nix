# Import all modules so configuration.nix only needs to Import all.nix
   

{ config, pkgs, lib, ... }:

{
  imports = [
    ############
    # Imported #
    ############

    # All-System
    ./Imported/System/all-System.nix
  ];
}
