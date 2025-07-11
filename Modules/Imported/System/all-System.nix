# Import all modules so configuration.nix only needs to Import all.nix
   

{ config, pkgs, lib, ... }:

{
  imports = [
    ############
    # Software #
    ############

    # Cli
    ./Software/cli/cli-tools.nix
    ./Software/cli/docker.nix
    ./Software/cli/openssh.nix
    ./Software/cli/vm.nix
    ./Software/cli/remote-manage.nix
    ./Software/cli/zsh.nix

    #/Software Desktop Enviorments
    ./Software/Desktop-Enviorments/kde.nix

    #/Software Gaming
    ./Software/Gaming/steam.nix

    ############
    # Hardware #
    ############

    # Surface
    ./Hardware/Surface/Custom-Kernel.nix

    ###########
    # Default #
    ###########

    ./default.nix

  ];
}
