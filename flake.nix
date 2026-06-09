{
  description = "Home Manager configuration of neo";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
     };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = { 
        nixpkgs.follows = "nixpkgs-stable";
	home-manager.follows = "home-manager";
       };
      };

    helium = {
      url = "github:schembriaiden/helium-browser-nix-flake";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
  };

  outputs =
    { nixpkgs, nixpkgs-stable, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      
      pkgs = import nixpkgs {
 	inherit system;
	config.allowUnfree = true;
       };

       
      pkgs-stable = import nixpkgs-stable {
        inherit system;
	config.allowUnfree = true;
       };

    in
    {
      homeConfigurations."neo" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
	./home.nix 
	];

	extraSpecialArgs = {
	  inherit pkgs-stable inputs;
	 }; 

      #pkgs = nixpkgs.legacyPackages.${system};
      };
    };
}
