
{ config, lib, pkgs, ... }:

with lib;

{
  options.kde.enable = mkEnableOption "Enable KDE browser";

  config = mkIf config.kde.enable {
        services.xserver.enable = true;
        services.displayManager.sddm.enable = true;
        services.desktopManager.plasma6.enable = true;
        services.xserver.xkb = {
          layout = "de";
          variant = "";
        };
   };
}
