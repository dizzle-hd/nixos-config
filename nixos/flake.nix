{
  description = "Julian's First Flake!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    helium.url = "github:oxcl/nix-flake-helium-browser";

    home-manager = { 
    url = "github:nix-community/home-manager/release-26.05";
    inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, helium, home-manager, ... }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit helium; };

        modules = [
          ./configuration.nix
          ./modules/user-programs.nix
          ./modules/fonts.nix
          ./modules/hyprland.nix
          ./modules/cursor-bibata.nix
          ./modules/system-packages.nix

	  home-manager.nixosModules.home-manager
        ];
      };
    };
}

