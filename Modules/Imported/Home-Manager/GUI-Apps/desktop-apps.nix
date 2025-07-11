{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.desktopApps or config.home.desktopApps;
in
{
  options = {
    home.desktopApps.enable = mkEnableOption "Enable common desktop applications like Gwenview, LibreOffice, Krita, etc.";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      kdePackages.gwenview       # KDE image viewer
      kdePackages.okular         # PDF/document viewer
      thunderbird                # Email client
      libreoffice                # Office suite
      krita                      # Digital painting software
    ];
  };
}


