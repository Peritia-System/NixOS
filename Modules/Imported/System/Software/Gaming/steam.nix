{ config, lib, pkgs, ... }:

with lib;

{
  options.steam.enable = mkEnableOption "Enable Steam and dependencies";

  config = mkIf config.steam.enable {
    programs.steam.enable = true;

    environment.systemPackages = with pkgs; [
      protonup
    ];


  };
}
