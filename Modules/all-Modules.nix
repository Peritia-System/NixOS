# Import all modules so configuration.nix only needs to Import all.nix
   
{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ############
    # Imported #
    ############

    # All-System
    ./Imported/System/all-System.nix
  ];
}
