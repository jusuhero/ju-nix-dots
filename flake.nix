{
  description = "My flake";
  
inputs = {
  nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  home-manager = {
   url = "github:nix-community/home-manager";
   inputs.nixpkgs.follows = "nixpkgs";
  };
  hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
  stylix.url = "github:danth/stylix";
};

outputs = { self, nixpkgs, home-manager, hyprland, ...}: 

let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
	  config.allowUnfree = true;	
  };
  lib = nixpkgs.lib;

in {
nixosConfigurations = {
    watsaket = lib.nixosSystem rec {
      inherit system;
      specialArgs = { inherit hyprland; };
      modules = [ 
        ./nix/configuration.nix
        ./modules/stylix.nix
	      ./hosts/WATSAKET/hardware-configuration.nix
        hyprland.nixosModules.default
        home-manager.nixosModules.home-manager
        inputs.stylix.nixosModules.stylix
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.ju = import ./home/home.nix;
          home-manager.extraSpecialArgs = specialArgs;
        }
      ];
     };
     angkorwat = lib.nixosSystem{
	system = "x86_64-linux";
	modules = [
		./hosts/ANGKORWAT/hardware-configuration.nix
		./nix/configuration.nix
	];
    };
  };

};
}
