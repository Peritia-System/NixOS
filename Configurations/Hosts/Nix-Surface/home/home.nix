{ config, nixDirectory, pkgs,... }:

let
  # Import user-specific variables
  userVars = import ../variables/user-vars.nix;
  inherit (userVars) username gitUsername gitEmail;
in
{
  ################################################################
  # Basic Home Manager Setup
  ################################################################
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.05";

  ################################################################
  # Module Imports
  ################################################################
  imports = [
    # ZSH configuration (zshrc, plugins, etc.)
    ../../../../Modules/Imported/Home-Manager/Shells/zsh-hm.nix

    # Desktop and GUI app groups
    ../../../../Modules/Imported/Home-Manager/GUI-Apps/desktop-apps.nix

    # Web app wrappers (e.g. Outlook, Teams)
    ../../../../Modules/Imported/Home-Manager/webapps/webapps.nix

    # Import Nyx Tools
    ../../../../Misc/Nyx-Tools/nyx.nix
    
  ];
    

  ################################################################
  # Nyx Tools
  ################################################################
  modules.nyx-rebuild = {
    enable = true;
    inherit username nixDirectory;  
    editor = "nvim";            # or "hx", "vim"
    formatter = "alejandra";    # or other supported formatters
    enableAlias = false;         # adds `nr` alias for convenience
    autoPush = false;            # automatically pushes after commit
    enableFormatting = false; 
    startEditor = false;
  };
  modules.nyx-cleanup = {
    enable = true;
    inherit username nixDirectory;
    autoPush = false;
    keepGenerations = 5;     # Keep last 5 generations (optional, default = 5)
    enableAlias = false;      # Adds `nc` alias for convenience
  };

    
  modules.nix-tool = {
    inherit username nixDirectory;
    enable = true;
  }; 
  ################################################################
  # Package Selection
  ################################################################
  # Programs to install with Home Manager
  home.packages = import ./user-packages.nix { inherit pkgs; };

  ################################################################
  # Feature Modules
  ################################################################

  # Enable common desktop apps (e.g., LibreOffice, Krita, etc.)
  home.desktopApps.enable = true;

  # Enable specific web apps
  webapps = {
    enable = true;
    discord.enable = false;
    slack.enable = true;
    teams.enable = true;
    outlook.enable = true;
    entra.enable = true;
  };

  

  ################################################################
  # Git Configuration
  ################################################################
  programs.git = {
    enable = true;
    userName = gitUsername;
    userEmail = gitEmail;

    aliases = {
      co = "checkout";
      ci = "commit";
      st = "status";
      br = "branch";
    };
  };
}
