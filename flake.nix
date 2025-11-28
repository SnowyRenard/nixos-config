{
  description = "NixOS configuration";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fht-compositor = {
      url = "github:nferhat/fht-compositor";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.rust-overlay.follows = "";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, nur, ... }: {
    nixosConfigurations.nixos-desktop = let
        username = "snowyrenard";
        specialArgs = { inherit username; };
      in
        nixpkgs.lib.nixosSystem {
        inherit specialArgs;
          system = "x86_64-linux";
          
          modules = [
            ./hosts/nixos-desktop
            
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./users/${username}/home.nix;

              nixpkgs.overlays = [ nur.overlays.default ];
            }
          ];
      };
      nixosConfigurations.nixos-laptop = let
        username = "snowyrenard";
        specialArgs = { inherit username; };
      in
        nixpkgs.lib.nixosSystem {
        inherit specialArgs;
          system = "x86_64-linux";
          
          modules = [
            ./hosts/ASUS-A17

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./users/${username}/home.nix;

              nixpkgs.overlays = [ nur.overlays.default ];
            }
          ];
    };
      nixosConfigurations.alex-desktop= let
        username = "alexander";
        specialArgs = { inherit username; };
      in
        nixpkgs.lib.nixosSystem {
        inherit specialArgs;
          system = "x86_64-linux";
          
          modules = [
            ./hosts/AlexDesktop

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./users/${username}/home.nix;

              nixpkgs.overlays = [ nur.overlays.default ];
            }
          ];
    };
  };
}
