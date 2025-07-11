{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.webapps;
  browser = "${pkgs.chromium}/bin/chromium";
in
{
  config = mkIf (cfg.enable && cfg.discord.enable) {
    xdg.desktopEntries.discord = {
      name = "Discord";
      exec = "${browser} --app=https://discord.com/app";
      icon = "discord";
      type = "Application";
    };
  };
}
