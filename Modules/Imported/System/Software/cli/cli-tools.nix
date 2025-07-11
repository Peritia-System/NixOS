{ lib, config, pkgs, ... }:

with lib;

{
  options.cliTools.enable = mkEnableOption "Enable CLI tools like fastfetch and hyfetch";

  config = mkIf config.cliTools.enable {
    environment.systemPackages = with pkgs; [
      fastfetch
      hyfetch
      bat
      fzf
      tree
      lsd
      
    ];
  };
}
