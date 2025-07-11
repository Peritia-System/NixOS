{ config, pkgs, ... }:

let
  catppuccin = config.colourpallette.catppuccin-mocha;
in {

    imports = 
    [
      ../Colourpallettes/catpuccin.nix
    ];


  stylix = {
    ##################################################
    # 🎨 Base16 Theme (Catppuccin Mocha)
    ##################################################
    base16Scheme = {
      base00 = catppuccin.crust;
      base01 = catppuccin.mantle;
      base02 = catppuccin.base;
      base03 = catppuccin.surface0;
      base04 = catppuccin.surface1;
      base05 = catppuccin.text;
      base06 = catppuccin.subtext0;
      base07 = catppuccin.subtext1;
      base08 = catppuccin.red;
      base09 = catppuccin.peach;
      base0A = catppuccin.yellow;
      base0B = catppuccin.green;
      base0C = catppuccin.teal;
      base0D = catppuccin.blue;
      base0E = catppuccin.mauve;
      base0F = catppuccin.flamingo;
    };


    ##################################################
    # 🔤 Fonts (Windows-like aesthetic)
    ##################################################
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts._0xproto;
        name = "0xProto Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.vistafonts;
        name = "Tahoma";
      };
      serif = {
        package = pkgs.vistafonts;
        name = "Times New Roman";
      };
      sizes = {
        applications = 11;
        terminal = 12;
        desktop = 10;
        popups = 10;
      };
    };


    ##################################################
    # 🌫 Opacity Settings
    ##################################################
    opacity = {
      applications = 1.0;
      terminal = 1.0;
      desktop = 1.0;
      popups = 1.0;
    };

    ##################################################
    # 🌓 Theme Polarity
    ##################################################
    polarity = "dark";

   ############### Stylix Theme Setup ###############

 };
}
