{
  description = "NixOS configuration";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.nixos-desktop = let
        username = "snowyrenard";
        specialArgs = { inherit username; };
      in
        nixpkgs.lib.nixosSystem {
        inherit specialArgs;
          system = "x86_64-linux";
          
          modules = [
            ./hosts/MS-7816

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./users/${username}/home.nix;
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
            }
          ];
    };
  };
}
