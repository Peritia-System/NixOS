{
  description = "Main - Flake";

  ################################################################
  # 🔗 Inputs
  ################################################################
  inputs = {
    # Core NixOS packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Hardware support (Surface, etc.)
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    # Stylix theming support
    stylix.url = "github:danth/stylix";
  };

  ################################################################
  # 🚀 Outputs
  ################################################################
  outputs = inputs@{ self, nixpkgs, home-manager, nixos-hardware, stylix, ... }: {
    nixosConfigurations = {
    
      ############################################################
      # 💻 Default
      ############################################################
      defualt = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
          host = "Default";
        };
        modules = [
          ./Configurations/Hosts/Default/configuration.nix
        ];
      };
     
      ############################################################
      # 💻 Surface Laptop Config
      ############################################################
      nix-surface = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
          host = "Default";
        };
        modules = [
          ./Configurations/Hosts/Nix-Surface/configuration.nix
          inputs.stylix.nixosModules.stylix
        ];
      };

    };
  };
}
