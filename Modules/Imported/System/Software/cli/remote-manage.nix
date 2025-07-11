{ config, lib, pkgs, ... }:

with lib;

{
  options.remoteManage = {
    enable = mkEnableOption "Enable remote management tools (TeamViewer, RustDesk)";
    teamviewer.enable = mkEnableOption "Enable TeamViewer";
    rustdesk.enable = mkEnableOption "Enable RustDesk";
  };

  config = mkIf config.remoteManage.enable (mkMerge [

  
    # 🔹 TeamViewer (unfree)
    (mkIf config.remoteManage.teamviewer.enable {
      services.teamviewer.enable = true;
      environment.systemPackages = with pkgs; [ teamviewer ];
    })

    # 🔹 RustDesk
    (mkIf config.remoteManage.rustdesk.enable {
      environment.systemPackages = with pkgs; [ rustdesk ];
    })

  ]);
}
